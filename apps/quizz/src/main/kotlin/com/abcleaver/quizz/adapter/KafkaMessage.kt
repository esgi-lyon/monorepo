package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.port.MessageOut
import java.util.*

class KafkaMessage : MessageOut {
  override fun dispatch(correct: Boolean, answer: String, userId: UUID, question: String, time: Double) {
    println("dispatch message correct: $correct, answer: $answer, userid: $userId, question: $question, time: $time")
  }
}
