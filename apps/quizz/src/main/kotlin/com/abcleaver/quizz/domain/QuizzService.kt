package com.abcleaver.quizz.domain

import com.abcleaver.quizz.port.ImageOut
import com.abcleaver.quizz.port.MessageOut
import java.util.*

class QuizzService constructor(imageIn: ImageOut, private val messageOut: MessageOut) {

  private val questionService: QuestionService = QuestionService(imageIn)

  fun get (questionNumber: Int = 15): Quizz {
    val questions = (1..questionNumber)
      .map { AlphabetService.getRandomLetter() }
      .map { questionService.createQuestion(it)  }
      .toList()

    return Quizz(questions);
  }

  fun submit(answer: String, userId: UUID, question: Letter, time: Double): Boolean {
    val correct = isCorrect(answer, question)

    messageOut.dispatch(
      correct,
      answer,
      userId,
      question.toString(),
      time
    )

    return correct
  }

  private fun isCorrect( answer: String, question: Letter): Boolean = Letter.fromString(answer) == question

}
