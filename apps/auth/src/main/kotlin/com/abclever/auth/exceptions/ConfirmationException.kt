package com.abclever.auth.exceptions

class ConfirmationException: IllegalArgumentException {
  constructor():
    super("password confirmation isn't the same")
}
