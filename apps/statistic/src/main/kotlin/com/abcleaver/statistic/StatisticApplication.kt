package com.abcleaver.statistic

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication class StatisticApplication

fun main(args: Array<String>) {
  runApplication<StatisticApplication>(*args)
}
