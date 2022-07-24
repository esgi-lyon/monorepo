package com.abcleaver.quizz.domain

import java.net.URI
import java.nio.file.Path

data class Proposal(val content: Map<Letter, URI>) { }
