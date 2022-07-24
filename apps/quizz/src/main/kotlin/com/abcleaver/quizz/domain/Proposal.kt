package com.abcleaver.quizz.domain

import java.net.URI

data class Proposal(val content: Map<Letter, URI>)
