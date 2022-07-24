package com.abcleaver.quizz.domain

data class Letter (val characters : List<Char>) {
  override fun toString(): String {
    return characters.joinToString("")
  }

  companion object {
    fun fromString(string: String): Letter {
      return Letter(string.toList())
    }

  }

}
