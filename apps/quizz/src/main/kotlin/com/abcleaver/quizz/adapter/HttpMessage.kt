package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.port.MessageOut
import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import okhttp3.MediaType
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import org.springframework.web.util.UriComponentsBuilder
import java.io.IOException

class HttpMessage(private val gamificationHost: String, private val gamificationPort: String) : MessageOut {
  val JSON: MediaType = "application/json; charset=utf-8".toMediaType()

  override fun dispatch(correct: Boolean, answer: String, userId: Long, question: String) {
    val client = OkHttpClient()
    val dto = UserAnswerDto(correct, answer, userId, question)
    val body: RequestBody = jacksonObjectMapper().writeValueAsString(dto).toRequestBody(JSON)

    val url = UriComponentsBuilder.newInstance()
      .scheme("http")
      .host(gamificationHost).port(gamificationPort)
      .path("/user-answers/")
      .build()
      .toUri().toURL()

    val request = Request.Builder()
      .url(url)
      .post(body)
      .build()

    client.newCall(request)
      .execute()
      .use { response -> if (!response.isSuccessful) throw IOException("Unexpected code $response") }
  }
}