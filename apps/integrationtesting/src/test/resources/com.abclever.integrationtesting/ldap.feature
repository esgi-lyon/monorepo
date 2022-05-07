@auth @ldap
Feature: ldap

  Background:
    Given docker rebuild once postgres
    And start apps auth-server,auth with boot time 10000
    Given set rest address to auth-server
    When post to /ldap with data:
      | phoneNumber  | name      | password   | confirmationPassword | address        | picture | email             | birthdate  | familyName | gender |
      | +33607080910 | Christian | Ttmqsa05!? | Ttmqsa05!?           | 34 toto street | ""      | christian@foo.com | 2007-01-01 | Jojo       | man    |
    Then response status is 201 and contains "toto@foo.com successfully registered"

  Scenario: Multiple errors in registration
    Given set rest address to auth-server
    When post to /ldap with data:
      | phoneNumber  | name      | password   | address        | picture | email        | birthdate  | familyName | gender |
      | +33607080910 | Christian | 10/12/1976 | 34 toto street | ""      | toto@foo.com | 2007-01-01 | Jojo       | 0      |
    Then response status is 400 and contains "Password is too weak"
    And response status is 400 and contains "gender must be a valid enum value"

  Scenario: Valid registration
    Given set rest address to auth-server
    When post to /ldap with data:
      | phoneNumber  | name    | password   | confirmationPassword | address        | picture | email        | birthdate  | familyName | gender |
      | +33607080911 | Nicolas | Ttmqsa00!? | Ttmqsa00!?           | 34 juju street | ""      | juju@foo.com | 2000-01-01 | Juju       | woman  |
    Then response status is 201 and contains "juju@foo.com successfully registered"

  Scenario: Valid password change
    Given set rest address to auth-server
    When patch to /ldap with data:
      | phoneNumber  | name | password   | confirmationPassword | oldPassword | address        | picture | email        | birthdate  | familyName | gender |
      | +33607080910 | Toto | Ttmqsa10!? | Ttmqsa10!?           | Ttmqsa05!?  | 34 toto street | ""      | toto@foo.com | 2007-01-01 | Jojo       | man    |
    Then response status is 200 and contains "toto@foo.com successfully updated"

  Scenario: Valid password change
    Given set rest address to auth-server
    When patch to /ldap with data:
      | phoneNumber  | name | password   | confirmationPassword | oldPassword | address        | picture | email        | birthdate  | familyName | gender |
      | +33607080910 | Toto | Ttmqsa10!? | Ttmqsa10!?           | Ttmqsa05!?  | 34 toto street | ""      | toto@foo.com | 2007-01-01 | Jojo       | man    |
    Then response status is 200 and contains "toto@foo.com successfully updated"
