package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.domain.Letter
import com.abcleaver.quizz.port.ImageOut
import java.nio.file.Path

class LocalImage : ImageOut {
  override fun getImage(letter: Letter): Path {
//    TODO implement this
    return Path.of("https://flif.info/example-images/fish.png")
  }
}
