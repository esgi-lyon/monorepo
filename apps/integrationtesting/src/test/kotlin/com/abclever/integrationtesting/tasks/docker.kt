package com.abclever.integrationtesting.tasks

import com.abclever.integrationtesting.strings.splitCommas
import kotlinx.coroutines.DelicateCoroutinesApi

fun getComposeCmd(cmd: String) = "docker-compose -f %s $cmd %s"

@DelicateCoroutinesApi
fun dockerComposeCmd(services: List<String>, cmd: String): NamedTask {
  return launchMultiple(services, getComposeCmd(cmd), userCwd = "$cwd/docker-compose.yaml")
}

@DelicateCoroutinesApi
fun dockerRebuild(services: String): NamedTask {
  dockerDown(services, "-v")

  val serviceList = splitCommas(services)

  val servicesUp = dockerComposeCmd(serviceList, "up -d")
  delayBlocking(3000)

  return servicesUp
}

@DelicateCoroutinesApi
fun dockerDown(services: String, opts: String = "") {
  val serviceList = splitCommas(services)
  val downTasks = dockerComposeCmd(serviceList, "down $opts")

  delayBlocking(1200)
  kill(downTasks)
}
