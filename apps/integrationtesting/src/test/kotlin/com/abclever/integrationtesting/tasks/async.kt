package com.abclever.integrationtesting.tasks

import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

fun delayBlocking(it: Int) {
  runBlocking { delay(it.toLong()) }
}
