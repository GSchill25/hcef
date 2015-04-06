Feature: Standard Business
  As a user
  I want to be able to view certain information
  So I can have confidence in the system
  
  Background:
  
  Scenario: Do not see the default rails page
    When I go to the home page
    Then I should not see "You're riding Ruby on Rails!"
    And I should not see "About your application's environment"
    And I should not see "Create your database" 
  
  Scenario: Spot Log-in button
    When I go to the home page
    Then I should see "Log-in" within "#_nav_bar"