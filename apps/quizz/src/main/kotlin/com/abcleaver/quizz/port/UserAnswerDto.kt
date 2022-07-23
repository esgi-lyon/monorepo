package com.abcleaver.quizz.port

data class UserAnswerDto( val answer: String,
                          val userId: Long,
                          val question: String)
