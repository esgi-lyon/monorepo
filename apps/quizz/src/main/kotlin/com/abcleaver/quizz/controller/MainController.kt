package com.abcleaver.quizz.controller

import org.springframework.security.core.annotation.AuthenticationPrincipal
import org.springframework.security.oauth2.core.oidc.user.OidcUser
import org.springframework.web.bind.annotation.*

@RestController
class MainController {
  @GetMapping("/")
  fun index(): Map<String, String> {
    return mapOf("message" to "Quizz - home")
  }

  @CrossOrigin(allowedHeaders = ["*"], methods = [RequestMethod.GET])
  @RequestMapping(value = ["/me"], method = [RequestMethod.GET])
  fun me(@AuthenticationPrincipal u: OidcUser): OidcUser {
    return u
  }
}
