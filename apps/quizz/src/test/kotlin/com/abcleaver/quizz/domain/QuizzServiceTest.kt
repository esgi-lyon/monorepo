package com.abcleaver.quizz.domain

import com.abcleaver.quizz.adapter.KafkaMessage
import com.abcleaver.quizz.adapter.LocalImage
import java.nio.file.Path
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertIs


internal class QuizzServiceTest() {

  private var quizzService: QuizzService
  private var alphabet: Set<String> = setOf("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

  init {
    val imageOut = LocalImage("locahost", "8081")
    val messageOut = KafkaMessage()
    quizzService = QuizzService(imageOut, messageOut)
  }

  @Test
  fun quizz_should_have_the_requested_size(){
    assert(quizzService.get(15).questions.size.equals(15))
    assert(quizzService.get(400).questions.size.equals(400))
  }

  @Test
  fun quizz_should_contain_questions(){
    val quizz = quizzService.get(2)
    val (letter, imagePath, _, proposal) = quizz.questions.first()

    assertIs<Letter>(letter)
    assertIs<Path>(imagePath)
    assertIs<Proposal>(proposal)
    assertEquals(proposal.content.size, 3)
  }

}
