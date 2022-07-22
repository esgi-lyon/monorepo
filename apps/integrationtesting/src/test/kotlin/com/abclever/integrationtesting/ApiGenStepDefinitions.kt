package com.abclever.integrationtesting

import com.abclever.gen.gamification.api.MainControllerApi
import io.cucumber.java8.En
import org.assertj.core.api.Assertions

class ApiGenStepDefinitions : En {
  private val gamificationMain: MainControllerApi = MainControllerApi()

  init {

    this.Then("gamification main get index ok") {
      Assertions.assertThat(gamificationMain.index()["message"]).isEqualTo("Gamification - home")
    }
  }
}
