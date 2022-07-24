package com.abcleaver.quizz.port

import com.abcleaver.quizz.domain.Letter
import java.net.URI

interface ImageOut {
  fun getImage(letter: Letter): URI
}
