@gamification
Feature: api_gamification

  Scenario: Full login interaction success
    Given start apps gamification with boot time 15000
    Then gamification main get index ok
    Then stop apps gamification
