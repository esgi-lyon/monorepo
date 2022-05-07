package com.abclever.auth.exceptions;

import org.springframework.security.core.AuthenticationException;

public class AuthUserException extends AuthenticationException {
  public AuthUserException(String msg) {
    super(msg);
  }
}
