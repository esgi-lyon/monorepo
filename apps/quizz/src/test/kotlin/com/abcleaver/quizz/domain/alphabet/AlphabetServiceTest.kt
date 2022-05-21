package com.abcleaver.quizz.domain.alphabet

import com.abcleaver.quizz.domain.AlphabetService
import kotlin.test.Test
import kotlin.test.assertContains

internal class AlphabetServiceTest {
  @Test
  fun getRandomLetters() {
    val alphabet = setOf("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");

    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
    assertContains(alphabet, AlphabetService.getRandomLetter().toString())
  }
}
