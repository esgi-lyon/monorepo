package com.abcleaver.quizz.port

import com.abcleaver.quizz.domain.QuestionType

data class UserAnswerDto( val answer: String,
                          val userId: Long,
                          val question: String,
                          val questionType: QuestionType)
