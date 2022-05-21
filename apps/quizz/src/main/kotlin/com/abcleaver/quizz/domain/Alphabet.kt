package com.abcleaver.quizz.domain

import java.util.*
import kotlin.random.Random

internal data class Alphabet(val letters: Set<Letter>) {
  fun getRandomLetter(): Letter {
    return letters.elementAt(Random.nextInt(0, letters.size))
  }

  fun getRandomLetterExcept(letter: Letter): Letter {
    return letters
      .filter { it !== letter }
      .elementAt(Random.nextInt(0, letters.size - 1))
  }

  companion object {
    fun from(lettersString: Set<String>): Alphabet {
      val letters = lettersString.map { stringToChars(it) }
        .map { Letter(it) }
        .toSet()

      return Alphabet(letters)
    }

    private fun stringToChars(it: String): List<Char> {
      return Optional.ofNullable(it.chars()
        .mapToObj { it.toChar() }
        .toList())
        .orElse(listOf())
    }
  }
}




