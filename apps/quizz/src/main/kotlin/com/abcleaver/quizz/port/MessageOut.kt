package com.abcleaver.quizz.port

import java.util.*

interface MessageOut {
  fun dispatch(correct: Boolean, answer: String, userId: UUID, question: String, time: Double)
}
