package com.abcleaver.quizz.port

data class UserAnswerDto( val answer: String,
                          val userId: String,
                          val question: String,
                          val time: Double)
