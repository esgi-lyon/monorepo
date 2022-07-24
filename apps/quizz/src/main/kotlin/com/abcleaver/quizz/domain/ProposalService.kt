package com.abcleaver.quizz.domain

import com.abcleaver.quizz.port.ImageOut
import com.abcleaver.quizz.domain.Proposal

class ProposalService constructor(private val imageOut: ImageOut) {
  fun generate(letter: Letter): Proposal {
    val content = (1..4)
      .map { AlphabetService.getRandomLetter(letter) }
      .associateWith { imageOut.getImage(it) }

    return Proposal(content)
  }
}
