package com.abclever.integrationtesting

import com.abclever.integrationtesting.restassured.RestTestingEnv
import com.abclever.integrationtesting.restassured.Templating
import com.abclever.integrationtesting.strings.randomString
import io.cucumber.datatable.DataTable
import io.cucumber.java8.En
import io.cucumber.java8.Scenario
import io.restassured.filter.cookie.CookieFilter
import io.restassured.filter.session.SessionFilter
import kotlinx.serialization.Serializable
import org.assertj.core.api.Assertions

var lastInstanceAuth: AuthStepDefinitions? = null

class AuthStepDefinitions(private val templating: Templating) : En {

  init {
    val restTestingEnv = RestTestingEnv(templating, CookieFilter(), SessionFilter())

    @Serializable
    data class Client(val client_name: String, val redirect_uris: List<String>, val scopes: String)

    DataTableType { entry: Map<String, String> ->
      var clientName = entry["client_name"]!!
      val isApp = entry["is_app"].toBoolean()
      val scopes = entry["scopes"]!!

      if (clientName == "random" || !isApp) clientName = randomString(15)

      val redirectUris =
          entry["redirect_uris"]!!
              .split(",")
              .map(String::trim)
              .map { if (isApp) "${apps[clientName]}/${it}" else it }
              .toList()

      return@DataTableType Client(clientName, redirectUris, scopes)
    }

    this.Before { _: Scenario ->
      Assertions.assertThat(this).isNotSameAs(lastInstanceAuth)
      lastInstanceAuth = this
    }

    var alreadyAdded: List<String> = listOf()

    this.When("post client to {word}:") { route: String, table: DataTable ->
      val clients: List<Client> = table.asList(Client::class.java)

      clients.forEach {
        if (it.client_name in alreadyAdded) return@forEach

        val reqSpec = restTestingEnv.getSpecForSerializable(it)

        val currentResponse =
            restTestingEnv.processReqForMethod(
                reqSpec, "post", this.templating.processExpressionInWord(route))

        this.templating.add(mapOf("currentResponse" to (currentResponse as Any)))

        alreadyAdded = alreadyAdded + listOf(it.client_name)
      }
    }

    this.After { _: Scenario ->
      Assertions.assertThat(this).isSameAs(lastInstanceAuth)
      lastInstanceAuth = this
    }
  }
}
