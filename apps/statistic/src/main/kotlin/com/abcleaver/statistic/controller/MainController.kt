package com.abcleaver.statistic.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class MainController {
  @GetMapping("/")
  fun index(): String {
    return "statistic"
  }
}
