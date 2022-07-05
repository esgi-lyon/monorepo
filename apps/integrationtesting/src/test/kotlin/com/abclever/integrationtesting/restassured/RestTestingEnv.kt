package com.abclever.integrationtesting.restassured

import io.restassured.RestAssured
import io.restassured.builder.RequestSpecBuilder
import io.restassured.config.HttpClientConfig
import io.restassured.config.RestAssuredConfig
import io.restassured.filter.cookie.CookieFilter
import io.restassured.filter.session.SessionFilter
import io.restassured.http.ContentType
import io.restassured.module.kotlin.extensions.Given
import io.restassured.module.kotlin.extensions.When
import io.restassured.specification.RequestSpecification
import org.apache.http.client.config.CookieSpecs
import org.apache.http.client.params.ClientPNames

class RestTestingEnv(
    private val templating: Templating,
    private val cookieFilter: CookieFilter,
    private val sessionFilter: SessionFilter
) {

  init {
    RestAssured.config =
        RestAssuredConfig.newConfig()
            .httpClient(
                HttpClientConfig.httpClientConfig()
                    .reuseHttpClientInstance()
                    .addParams(mapOf(ClientPNames.COOKIE_POLICY to CookieSpecs.DEFAULT)))
  }

  companion object {
    const val POST = "post"
    const val PATCH = "patch"
    const val PUT = "put"
    const val GET = "get"
    const val DELETE = "delete"
  }

  fun processReq(route: String, method: String, data: Map<String, Any>) {
    val reqSpec = this.getSpecForMethod(method, data)

    val res =
        this.processReqForMethod(reqSpec, method, this.templating.processExpressionInWord(route))

    this.templating.add(mapOf("currentResponse" to (res as Any)))
  }

  private fun addParamsSpec(
      requestSpecBuilder: RequestSpecBuilder,
      queryParams: Map<String, Any>
  ): RequestSpecBuilder {

    queryParams.forEach { requestSpecBuilder.addParam(it.key, it.value) }

    return requestSpecBuilder
  }

  fun processReqForMethod(spec: RequestSpecification, method: String, route: String) =
      when (method.lowercase()) {
        POST -> spec.When { post(route) }
        PATCH -> spec.When { patch(route) }
        PUT -> spec.When { put(route) }
        GET -> spec.When { get(route) }
        DELETE -> spec.When { delete(route) }
        else -> throw Exception("Invalid method $method for request to $route")
      }

  fun getSpecForMethod(method: String, data: Map<String, Any>) =
      if (method !in listOf("get", "delete"))
          Given {
            body(data)
            filter(cookieFilter)
            filter(sessionFilter)
            contentType(ContentType.JSON)
          }
      else
          Given {
            spec(
                addParamsSpec(RequestSpecBuilder(), data)
                    .addFilter(cookieFilter)
                    .addFilter(sessionFilter)
                    .build())

            contentType(ContentType.ANY)
          }

  fun getSpecForSerializable(serializable: Any) = Given {
    body(serializable)
    filter(cookieFilter)
    filter(sessionFilter)
    contentType(ContentType.JSON)
  }
}
