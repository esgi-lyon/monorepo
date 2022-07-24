package com.abcleaver.quizz

import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
class SecurityConfig : WebSecurityConfigurerAdapter() {
  @Throws(Exception::class)
  override fun configure(http: HttpSecurity) {
    http
      .authorizeRequests {
        it
          .mvcMatchers(
            "/api-docs/**",
            "/*/api-docs**/**",
            "/swagger-ui/**",
            "/webjars/**",
            "/error**",
            "/public/**")
          .permitAll()
          // TODO add oauth2-client to configure required endpoints that extract scopes
          // .mvcMatchers("/")
          // .hasAuthority("SCOPE_openid")
          .anyRequest().authenticated()
      }
      .oauth2ResourceServer {
        it.jwt()
      }
      .cors()
      .disable()
      .csrf()
      .disable()
  }
}
