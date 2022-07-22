package com.abcleaver.gamification.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class MainController {

  @GetMapping("/")
  fun index(): Map<String, String> {
    return mapOf("message" to "Gamification - home")
  }
}
