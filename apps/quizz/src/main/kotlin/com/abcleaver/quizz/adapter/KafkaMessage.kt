package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.port.MessageOut

class KafkaMessage : MessageOut {
  override fun dispatch(correct: Boolean, answer: String, userId: Long, question: String) {
    println("dispatch message correct: $correct, answer: $answer, userid: $userId, question: $question")
  }
}
