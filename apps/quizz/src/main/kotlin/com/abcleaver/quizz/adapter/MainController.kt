package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.domain.Letter
import com.abcleaver.quizz.domain.Quizz
import com.abcleaver.quizz.domain.QuizzService
import com.abcleaver.quizz.port.QuizzIn
import com.abcleaver.quizz.port.UserAnswerDto
import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.*


@RestController
class MainController(  @Value("\${server.addressBis}") private val host : String,  @Value("\${server.port}")  private val port : String ) : QuizzIn {

  private lateinit var quizzService: QuizzService

  init {
    val imageOut = LocalImage(host, port)
    val messageOut = KafkaMessage()
    quizzService = QuizzService(imageOut, messageOut)
  }

  @GetMapping("/quizz")
  override fun index(@RequestParam("size") size: Int): Quizz {
    return quizzService.get(size)
  }

  @PostMapping("/user-answer")
  override fun submit(@RequestBody userAnswerDto: UserAnswerDto): Boolean{
    return quizzService.submit(userAnswerDto.answer,
      userAnswerDto.userId,
      Letter.fromString(userAnswerDto.question),
    )
  }

}
