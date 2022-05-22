package com.abcleaver.quizz.controller

import com.abcleaver.quizz.domain.Quizz
import com.abcleaver.quizz.domain.QuizzService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController


@RestController
class MainController {
  @GetMapping("/quizz")
  fun index(@RequestParam("size") size: Int): Quizz {
    return QuizzService.get(size)
  }
}
