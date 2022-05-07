@auth @interaction
Feature: interaction

  Background:
    Given docker rebuild once postgres
    And start apps auth-server,auth with boot time 10000
    Given set rest address to $apps.auth-server$
    When post to /ldap with data:
      | phoneNumber | name  | password   | confirmationPassword | email         | birthdate  | familyName | gender |
      | +33607080910 | Helen | Ttmqsa05!? | Ttmqsa05!?           | helen@foo.com | 2007-01-01 | Jojo        | man    |
    Then response status is 201 and contains "helen@foo.com successfully registered"

  Scenario: Full login interaction success
    Given set rest address to $apps.auth$
    When get to /oauth2/authorization/authserver
    Then response status is 200 and contains "uid"
    Given set rest address to $apps.auth-server$
    When post to /interaction/$currentResponse.uid$ with data:
      | password   | email         |
      | Ttmqsa05!? | helen@foo.com |
    Then response status is 200 and contains '{"prompt":{"name":"consent"'
    When post to /interaction/$currentResponse.uid$/confirm
    Then response status is 200 and contains "Auth app"
    Given set rest address to $apps.auth$
    Then get to /me
    Then response status is 200 and contains '"name":"Helen"'
