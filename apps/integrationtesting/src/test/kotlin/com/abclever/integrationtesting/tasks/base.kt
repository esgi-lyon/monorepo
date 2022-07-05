package com.abclever.integrationtesting.tasks

import java.io.BufferedReader
import java.io.InputStreamReader
import kotlinx.coroutines.*
import org.slf4j.LoggerFactory

typealias NamedTask = Map<String, Pair<Job, Process>>

private val logger = LoggerFactory.getLogger("Tasks")

var cwd: String = runBlocking {
  processOutput(exec("git rev-parse --show-toplevel"), ::bufToString)
}

fun bufToString(bufferedReader: BufferedReader) = bufferedReader.lines().toList().joinToString()

fun getAndLogCmd(cmd: String, format: String, userCwd: String?): String {
  val builtCmd: String =
      if (userCwd != null) String.format(format, userCwd, cmd) else String.format(format, cmd)

  logger.info("Command : $builtCmd")

  return builtCmd
}

fun readProcess(p: Process) {
  val reader = BufferedReader(InputStreamReader(p.inputStream))
  while (reader.readLine() != null) {
    logger.info(reader.readText())
  }
}

fun toJob(process: Process): Job {
  val job =
      CoroutineScope(Dispatchers.IO).launch {
        kotlin
            .runCatching {
              readProcess(process)
              process.waitFor()
            }
            .onFailure {
              logger.error(it.message)
              destroyWithDescendants(process)
            }
      }

  job.start()

  return job
}

fun destroyWithDescendants(p: Process) {
  p.descendants().forEach { it.destroy() }
  p.destroy()
}

fun delayToJob(p: Process, ms: Int): Job {
  delayBlocking(ms)

  return toJob(p)
}

@DelicateCoroutinesApi
fun launchMultiple(
    cmdParts: List<String>,
    format: String,
    timeBetween: Int = 1000,
    userCwd: String? = cwd
): NamedTask {
  val res =
      cmdParts.associateBy(
          keySelector = { it }, valueTransform = { exec(getAndLogCmd(it, format, userCwd)) })

  return res.entries.associate { it.key to Pair(delayToJob(it.value, timeBetween), it.value) }
}

@DelicateCoroutinesApi
fun restart(
    processes: Map<String, Pair<Job, Process>>,
    format: String,
    timeBetween: Int = 1000,
    userCwd: String? = cwd
) {
  kill(processes)
  launchMultiple(processes.keys.toList(), format, timeBetween, userCwd)
}

fun kill(processes: Map<String, Pair<Job, Process>>) {
  processes.forEach {
    destroyWithDescendants(it.value.second)
    it.value.first.cancelChildren()
    it.value.first.cancel()
  }
}

fun exec(cmd: String): Process = Runtime.getRuntime().exec(cmd)

internal fun <T> processOutput(p: Process, castFn: (BufferedReader) -> T): T =
    castFn(BufferedReader(InputStreamReader(p.inputStream)))
