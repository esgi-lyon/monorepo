package com.abclever.integrationtesting.restassured

import io.restassured.response.Response

class Templating(var varRegistery: Map<String, Any?> = mapOf()) {

  fun add(m: Map<String, Any>) {
    varRegistery = varRegistery + m
  }

  fun get(key: String): Any? {
    return varRegistery[key]
  }

  fun delete(key: String) {
    varRegistery = varRegistery.filter { it.key != key }
  }
  /** Non supported multiple variable */
  fun processExpressionInWord(word: String): String {

    val keyParts: List<String> = word.split("$")

    if (keyParts.size < 2 || word.count { it == '$' } % 2 != 0) return word

    val key = keyParts[1]

    var objIds = key.split(".")
    objIds = if (objIds.size > 1) objIds else listOf(objIds.first(), "")

    val (obj, objKey) = objIds

    val replacement = getReplacement(obj, objKey)

    val lastPart = if (keyParts.size > 2) keyParts[2] else ""

    return "${keyParts[0]}$replacement$lastPart"
  }

  fun processExpressionInMapEntries(map: Map<String, Any>) =
      map.mapValues {
        if (it.value is String) processExpressionInWord(it.value as String) else it.value
      }

  private fun getReplacement(obj: String, objKey: String): Any? {
    val varVal = varRegistery[obj]
    if (objKey == "") return "null"
    var replacement: Any? = null

    if (varVal is Response) replacement = varVal.jsonPath()?.get(objKey)!!

    if (varVal is Map<*, *>)
        replacement = kotlin.runCatching { varVal[objKey] }.getOrElse { varVal }

    println("replacement $replacement")

    return replacement
  }
}
