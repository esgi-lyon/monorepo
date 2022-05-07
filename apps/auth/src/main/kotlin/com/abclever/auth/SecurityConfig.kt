package com.abclever.auth

import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.web.util.matcher.AntPathRequestMatcher
import org.springframework.web.cors.CorsConfiguration
import org.springframework.web.cors.CorsConfigurationSource
import org.springframework.web.cors.UrlBasedCorsConfigurationSource

@Configuration
@ComponentScan(basePackages = ["com.abclever"])
@EnableWebSecurity(debug = false)
class SecurityConfig(
  @Value("\${cors.allowed.origins}") val origins: String,

  ) : WebSecurityConfigurerAdapter() {

  @Throws(java.lang.Exception::class)
  override fun configure(http: HttpSecurity) {
    http
      .authorizeRequests()

        .mvcMatchers(
          "/login", "/", "/api-docs/**", "/swagger-ui/**",
          "/webjars/**", "/error**", "/login/oauth2/code/**", "/oauth2/authorization/**"
        )
        .permitAll()
//         .mvcMatchers("/me")
//         .hasAuthority("openid")
        .anyRequest()
        .authenticated()
      .and()
        .oauth2Login()
      .and()
        .logout{
              // TODO call auth server auth/session/end"
              it.logoutRequestMatcher(AntPathRequestMatcher("/logout"))
              it.logoutSuccessUrl("/")
              it.deleteCookies("JSESSIONID")
              it.invalidateHttpSession(true)
              it.clearAuthentication(true)
        }
        .cors().disable()
        .csrf().disable()
  }

  @Bean
  fun corsConfigurationSource(): CorsConfigurationSource? {
    val configuration = CorsConfiguration()
    configuration.allowedOrigins = origins.split(",").map(String::trim)
    configuration.allowedMethods = listOf("GET", "POST", "PUT", "DELETE")
    val source = UrlBasedCorsConfigurationSource()
    source.registerCorsConfiguration("/**", configuration)

    return source
  }

  companion object {
    val logger = java.util.logging.Logger.getLogger(SecurityConfig::class.java.name)
  }
}
