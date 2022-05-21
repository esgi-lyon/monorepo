package com.abcleaver.quizz.domain

import java.nio.file.Path

data class Proposal(val content: Map<Letter, Path>) { }
