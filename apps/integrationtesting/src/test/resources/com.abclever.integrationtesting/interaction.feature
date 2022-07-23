@auth @interaction
Feature: interaction

  Background:
    Given docker rebuild once postgres
    And start apps auth-server with boot time 20000
    Given set rest address to $apps.auth-server$

  Scenario: Full login interaction success
    When post to /ldap with data:
      | phoneNumber  | name  | password   | confirmationPassword | email         | birthdate  | familyName | gender |
      | +33723242526 | Helen | Ttmqsa05!? | Ttmqsa05!?           | helen@foo.com | 2007-01-01 | Jojo       | man    |
    Then response status is 201 and contains "helen@foo.com successfully registered"
    Given set rest address to $apps.auth-server$
    When get to oidc/auth with data:
      | client_id | redirect_uri                   | scope                              | response_type | grant_type         |
      | apps      | http://localhost:3333/callback | email openid profile phone address | code          | authorization_code |
    Then response status is 200 and contains "uid"
    Given set rest address to $apps.auth-server$
    When post to /interaction/$currentResponse.uid$ with data:
      | password   | email         |
      | Ttmqsa05!? | helen@foo.com |
    Then response status is 200 and contains '{"prompt":{"name":"consent"'
    When post to /interaction/$currentResponse.uid$/confirm
    Then response status is 200 and contains "id_token"

