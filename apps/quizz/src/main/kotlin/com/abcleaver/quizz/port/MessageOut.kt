package com.abcleaver.quizz.port

interface MessageOut {
  fun dispatch(correct: Boolean, answer: String, userId: Long, question: String, type: String)
}
