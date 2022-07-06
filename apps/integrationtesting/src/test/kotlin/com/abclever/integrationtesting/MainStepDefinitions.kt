package com.abclever.integrationtesting

import com.abclever.integrationtesting.restassured.Templating
import com.abclever.integrationtesting.strings.splitCommas
import com.abclever.integrationtesting.tasks.*
import io.cucumber.java8.En
import io.cucumber.java8.Scenario
import kotlinx.coroutines.DelicateCoroutinesApi
import org.junit.jupiter.api.Assertions.*
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@DelicateCoroutinesApi var lastInstance: MainStepDefinitions? = null
var runningApps: NamedTask = mapOf()
var runningDockerServices: NamedTask = mapOf()
var singleTimeDockerTask: List<String> = listOf()

@DelicateCoroutinesApi
fun cleanEnv() {
  kill(runningApps)

  dockerDown(runningDockerServices.keys.joinToString(","))
  runningApps = mapOf()
}

@DelicateCoroutinesApi
class MainStepDefinitions(private val templating: Templating) : En {

  private var logger: Logger = LoggerFactory.getLogger(MainStepDefinitions::class.java)

  init {
    this.templating.add(mapOf("apps" to apps))

    this.Before { _: Scenario ->
      assertNotSame(this, lastInstance)
      lastInstance = this
    }

    this.BeforeStep { _: Scenario ->
      assertSame(this, lastInstance)
      lastInstance = this
    }

    this.AfterStep { _: Scenario ->
      assertSame(this, lastInstance)
      lastInstance = this
    }

    this.After { _: Scenario ->
      assertSame(this, lastInstance)
      lastInstance = this
    }

    this.Given("wait {int} ms") { it: Int ->
      println("[ Waiting for $it ms ]")
      delayBlocking(it)
    }

    this.Given("start apps {word} with boot time {int}") { userApps: String, bootTime: Int ->
      val enteringApps = splitCommas(userApps)
      if (runningApps.keys.containsAll(enteringApps)) return@Given

      val bootTimeWithForced =
          runCatching {
                Integer.parseInt(System.getenv("INTEGRATION_TEST_BOOT_TIME_MULTIPLIER")) * bootTime
              }
              .getOrDefault(bootTime)

      runningApps =
          runningApps + launchMultiple(enteringApps, "pnpm --dir %s exec nx serve %s", 1000)

      delayBlocking(bootTimeWithForced)
    }

    this.Given("stop apps {word}") { apps: String ->
      if (runningApps.isEmpty()) return@Given

      val filteredAppsToKill: NamedTask = runningApps.filter { it.key in splitCommas(apps) }
      kill(filteredAppsToKill)
      runningApps = runningApps.filter { it.key !in splitCommas(apps) }
    }

    this.Given("docker rebuild once {word}") { services: String ->
      val nonRunned = splitCommas(services).filter { !singleTimeDockerTask.contains(it) }
      if (nonRunned.isEmpty()) return@Given

      runningDockerServices = runningDockerServices + dockerRebuild(nonRunned.joinToString(","))
      singleTimeDockerTask = singleTimeDockerTask + nonRunned
    }

    this.Then("stop all current apps") {
      kill(runningApps)
      runningApps = mapOf()
    }

    this.Then("stop running containers") {
      kill(runningDockerServices)
      runningDockerServices = mapOf()
    }
  }
}
