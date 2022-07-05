package com.abclever.integrationtesting.restassured

import com.abclever.integrationtesting.strings.toHost
import com.abclever.integrationtesting.strings.toPort
import io.cucumber.datatable.DataTable
import io.cucumber.java8.En
import io.cucumber.java8.Scenario
import io.restassured.RestAssured
import io.restassured.filter.cookie.CookieFilter
import io.restassured.filter.session.SessionFilter
import io.restassured.http.ContentType
import io.restassured.module.kotlin.extensions.*
import io.restassured.response.Response
import org.assertj.core.api.Assertions
import org.hamcrest.CoreMatchers.containsString
import org.slf4j.Logger
import org.slf4j.LoggerFactory

var lastRestStepDefinitions: RestStepDefinitions? = null

class RestStepDefinitions(
    private val templating: Templating,
) : En {

  private var logger: Logger = LoggerFactory.getLogger(RestStepDefinitions::class.java)

  init {
    val restTestingEnv = RestTestingEnv(templating, CookieFilter(), SessionFilter())

    Before { _: Scenario ->
      Assertions.assertThat(this).isNotSameAs(lastRestStepDefinitions)
      lastRestStepDefinitions = this

      templating.delete("currentResponse")
    }

    this.Given("rest urls:") { table: DataTable? -> this.templating.add(table?.asMap() ?: mapOf()) }

    this.Given("set rest address to {word}") { app: String ->
      val host = this.templating.processExpressionInWord(app)

      RestAssured.baseURI = toHost(host)
      RestAssured.port = toPort(host)
    }

    this.When("{word} to {word} with data:") { method: String, route: String, table: DataTable? ->
      val data =
          this.templating.processExpressionInMapEntries(
              kotlin.runCatching { table?.asMaps()?.first() ?: mapOf() }.getOrElse { mapOf() })

      val reqSpec = restTestingEnv.getSpecForMethod(method, data)

      val currentResponse =
          restTestingEnv.processReqForMethod(
              reqSpec, method, this.templating.processExpressionInWord(route))

      this.templating.add(mapOf("currentResponse" to currentResponse))
    }

    this.When("{word} to {word}") { method: String, route: String ->
      val reqSpec = restTestingEnv.getSpecForMethod(method, mapOf())

      val currentResponse =
          restTestingEnv.processReqForMethod(
              reqSpec, method, this.templating.processExpressionInWord(route))

      this.templating.add(mapOf("currentResponse" to currentResponse))
    }

    this.Then("route {word} status is {int}") { route: String, code: Int ->
      Given { contentType(ContentType.ANY) } When { get(route.trim()) } Then { statusCode(code) }
    }

    this.Then("response status is {int} and contains {string}") { statusCode: Int, expected: String
      ->
      val lastResponse = templating.get("currentResponse") as Response?
      Assertions.assertThat(lastResponse).isNotNull
      lastResponse?.Then {
        statusCode(statusCode)
        body(containsString(expected))
      }
    }

    this.Then("response contains {string}") { expected: String ->
      val lastResponse = templating.get("currentResponse") as Response?
      Assertions.assertThat(lastResponse).isNotNull
      lastResponse?.Then { body(containsString(expected)) }
    }
  }
}
