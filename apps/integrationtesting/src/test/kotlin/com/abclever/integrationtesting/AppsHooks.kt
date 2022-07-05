package com.abclever.integrationtesting

import io.cucumber.plugin.EventListener
import io.cucumber.plugin.Plugin
import io.cucumber.plugin.event.EventPublisher
import io.cucumber.plugin.event.TestRunFinished
import kotlinx.coroutines.DelicateCoroutinesApi
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@DelicateCoroutinesApi
class AppsHooks : EventListener, Plugin {

  private var logger: Logger = LoggerFactory.getLogger(AppsHooks::class.java)

  override fun setEventPublisher(publisher: EventPublisher) {
    publisher.registerHandlerFor(TestRunFinished::class.java) {
      logger.info("[ Cleaning running test process ]")
      cleanEnv()
    }
  }
}
