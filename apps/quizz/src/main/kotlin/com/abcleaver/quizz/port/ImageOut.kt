package com.abcleaver.quizz.port

import com.abcleaver.quizz.domain.Letter
import java.nio.file.Path

interface ImageOut {
  fun getImage(letter: Letter): Path
}
