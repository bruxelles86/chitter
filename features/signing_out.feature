Feature: Signing out
  In order stop using Chitter
  Having signed in
  I must be able to sign out

  Scenario: Signing out
    Given I have registered
    And I am on the homepage
    And I click the button "Sign out"
    Then I should not see "Welcome to Chitter Bill"
    And I should see "Good bye! See you again soon"
