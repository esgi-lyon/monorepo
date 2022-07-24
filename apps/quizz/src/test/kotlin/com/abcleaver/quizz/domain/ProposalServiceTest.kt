package com.abcleaver.quizz.domain

import com.abcleaver.quizz.adapter.LocalImage
import org.junit.jupiter.api.Assertions.assertEquals
import java.nio.file.Path
import kotlin.test.Test
import kotlin.test.assertIs

internal class ProposalServiceTest() {
 private val proposalService: ProposalService;

  init {
    val imageOut = LocalImage("localhost", "8081")
    proposalService = ProposalService(imageOut)
  }

  @Test
  fun should_generate_four_proposal(){
    val content = proposalService.generate(Letter.fromString("a")).content

    assertIs<Map<Letter, Path>>(content)
    assertEquals(content.size, 4)
  }

  @Test
  fun proposal_should_not_contain_current_letter(){
    val letter = Letter.fromString("a")
    val content = proposalService.generate(letter).content
    assert(!content.containsKey(letter))
  }

}
