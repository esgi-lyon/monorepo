package com.abclever.integrationtesting.strings

import kotlin.reflect.KProperty

class StringTemplate(var value: () -> String) {
  operator fun getValue(thisRef: Nothing?, prop: KProperty<*>): String {
    return this.value()
  }

  operator fun setValue(thisRef: Nothing?, prop: KProperty<*>, value: String) {
    this.value = { value }
  }
}
