package com.abcleaver.quizz.domain

import com.abcleaver.quizz.port.ImageOut

class ProposalService constructor(private val imageOut: ImageOut) {
  fun generate(letter: Letter): Proposal {
    val content = (1..3)
      .map { AlphabetService.getRandomLetter(letter) }
      .map { it to imageOut.getImage(it) }
      .plus(Pair(letter, imageOut.getImage(letter)))
      .shuffled()
      .toMap()

    return Proposal(content)
  }
}
