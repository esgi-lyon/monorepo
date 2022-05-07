package com.abclever.auth.controller

import org.springframework.security.core.annotation.AuthenticationPrincipal
import org.springframework.security.oauth2.core.oidc.user.OidcUser
import org.springframework.web.bind.annotation.*
import java.util.logging.Logger

@RestController
@RequestMapping("/")
class MainController {

  @RequestMapping(value = ["/"], method = [RequestMethod.GET])
  fun home(): Any {
    return "Auth app"
  }

  @CrossOrigin(allowedHeaders = ["*"], methods = [RequestMethod.GET])
  @RequestMapping(value = ["/me"], method = [RequestMethod.GET])
  fun me(@AuthenticationPrincipal u: OidcUser): OidcUser {
    return u
  }

  companion object {
    val logger = Logger.getLogger(MainController::class.java.name)
  }
}
