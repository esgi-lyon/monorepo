@gamification
Feature: api_gamification

  Scenario: Full login interaction success
    Given start apps gamification with boot time 20000
    Then gamification main get index ok
    Then stop apps gamification
