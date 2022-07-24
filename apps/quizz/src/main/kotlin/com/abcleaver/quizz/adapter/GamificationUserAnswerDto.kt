package com.abcleaver.quizz.adapter

import java.util.*

data class GamificationUserAnswerDto(val correct: Boolean,
                                     val answer: String,
                                     val userId: UUID,
                                     val question: String,
                                     val time: Double
)
