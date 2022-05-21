package com.abcleaver.quizz.domain

import java.nio.file.Path
import kotlin.random.Random

enum class QuestionType {
  Letter, Image;

  companion object {
    fun getRandom(): QuestionType {
      val questionTypes = QuestionType.values()

      return questionTypes.get(Random.nextInt(0, questionTypes.size))
    }

  }

}

data class Question(val letter: Letter, val imagePath: Path, val questionType: QuestionType, val proposal: Proposal)
