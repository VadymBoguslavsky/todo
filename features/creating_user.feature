Feature: User want to log in
  In order to make a task manager
  As an author
  I want to create and manage tasks

  Scenario: Log in
    Given a user visits the sign in page
    When the user want to log in
    Then I should see Pizza
    And  I do not have tasks now
