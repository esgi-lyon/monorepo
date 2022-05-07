package com.abclever.integrationtesting.strings

fun validateUrl(url: String) = assert(url.matches("(https?://.*):(\\d)+\$".toRegex()))

fun toPort(url: String): Int {
  validateUrl(url)

  return url.split("://")[1].split(":")[1].toInt()
}

fun toHost(url: String): String {
  validateUrl(url)

  val schemeAndHost = url.split("://")

  return "${schemeAndHost[0]}://${schemeAndHost[1].split(":")[0]}"
}
