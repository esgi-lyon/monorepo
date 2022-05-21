package com.abcleaver.quizz.domain

import com.abcleaver.quizz.port.ImageOut

class QuestionService constructor(private val imageOut: ImageOut) {
  private val proposalService: ProposalService = ProposalService(imageOut);
  fun createQuestion(letter: Letter): Question {
    return Question(letter.copy(), imageOut.getImage(letter), QuestionType.getRandom(), proposalService.generate(letter))
  }

}
