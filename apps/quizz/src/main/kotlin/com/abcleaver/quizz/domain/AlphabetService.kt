package com.abcleaver.quizz.domain

internal object AlphabetService {
  private var alphabet: Alphabet = Alphabet.from(
    setOf(
      "a", "b", "c", "d", "e", "f", "g", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y",
      "z", "au", "ch", "oi", "on", "ou", "ai"
    )
  )

  fun getRandomLetter(): Letter {
    return alphabet.getRandomLetter()
  }

  fun getRandomLetter(letter: Letter): Letter {
    return alphabet.getRandomLetterExcept(letter);
  }

}
