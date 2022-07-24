package com.abcleaver.quizz.adapter

data class UserAnswerDto( val correct: Boolean,
                          val answer: String,
                          val userId: Long,
                          val question: String)
