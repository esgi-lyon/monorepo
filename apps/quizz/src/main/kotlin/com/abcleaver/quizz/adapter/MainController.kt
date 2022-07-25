package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.domain.Letter
import com.abcleaver.quizz.domain.Quizz
import com.abcleaver.quizz.domain.QuizzService
import com.abcleaver.quizz.port.QuizzIn
import com.abcleaver.quizz.port.UserAnswerDto
import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.*
import java.util.*


@RestController
class MainController(  @Value("\${server.address}") private val host : String,
                       @Value("\${server.port}")  private val port : String,
                       @Value("\${gamification.address}") private val gamificationHost: String,
                       @Value("\${gamification.port}") private val gamificationPort: String) : QuizzIn {

  private lateinit var quizzService: QuizzService

  init {
    val imageOut = LocalImage(host, port)
    val messageOut = HttpMessage(gamificationHost, gamificationPort)
    quizzService = QuizzService(imageOut, messageOut)
  }

  @GetMapping("/quizz")
  override fun index(@RequestParam("size") size: Int): Quizz {
    return quizzService.get(size)
  }

  @PostMapping("/user-answers")
  override fun submit(@RequestBody userAnswerDto: UserAnswerDto): Boolean{
    return quizzService.submit(userAnswerDto.answer,
      UUID.fromString(userAnswerDto.userId),
      Letter.fromString(userAnswerDto.question),
      userAnswerDto.time
    )
  }

}
