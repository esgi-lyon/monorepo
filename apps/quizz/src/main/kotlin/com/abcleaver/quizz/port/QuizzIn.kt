package com.abcleaver.quizz.port

import com.abcleaver.quizz.domain.Quizz

interface QuizzIn {
  fun index(size: Int): Quizz
  fun submit(userAnswerDto: UserAnswerDto): Boolean
}
