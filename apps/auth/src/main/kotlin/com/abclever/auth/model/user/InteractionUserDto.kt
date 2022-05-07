package com.abclever.auth.model.user

import org.springframework.validation.annotation.Validated
import javax.persistence.Column
import javax.validation.constraints.*

class InteractionUserDto {

  @Validated
  class Connecting {
    @Email
    var email: String? = null

    var password: String? = null
  }

  @Validated
  class Registering {
    @Email
    @NotNull
    @NotBlank
    var email: String? = null

    @NotNull
    @NotBlank
    var password: String? = null

    @NotNull
    @NotBlank
    var confirmationPassword: String? = null

    @Column(nullable = false)
    @NotBlank
    @NotNull
    var birthdate: String? = null

    @NotNull
    @NotBlank
    var firstName: String? = null

    @NotNull
    @NotBlank
    var lastName: String? = null

    @Column
    @Min(0)
    @Max(1)
    var gender: Int? = null;

    @NotEmpty
    val scopes: List<String> = listOf("profile", "email", "openid")
  }
}
