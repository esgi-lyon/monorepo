package com.abcleaver.quizz.domain

import com.abcleaver.quizz.adapter.KafkaMessage
import com.abcleaver.quizz.adapter.LocalImage
import java.net.URI
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertIs


class QuizzServiceTest {

  val imageOut: LocalImage = LocalImage("::1", "8085")
  val messageOut: KafkaMessage = KafkaMessage()
  val quizzService: QuizzService = QuizzService(imageOut, messageOut)
  var alphabet: Set<String> = setOf("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

  @Test
  fun quizz_should_have_the_requested_size(){
    assert(quizzService.get(15).questions.size == 15)
    assert(quizzService.get(400).questions.size == 400)
  }

  @Test
  fun quizz_should_contain_questions(){
    val quizz = quizzService.get(2)
    val (letter, imagePath, _, proposal) = quizz.questions.first()

    assertIs<Letter>(letter)
    assertIs<URI>(imagePath)
    assertIs<Proposal>(proposal)
    assertEquals(4, proposal.content.size)
  }

}
