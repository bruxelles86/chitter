Feature: Resetting my password
  In order to sign in to Chitter
  Having forgotten my password
  I must be able to reset it

  Scenario: Reaching the password reset page
    Given I have registered
    And I am on the sign in page
    And I click the link "Forgotten your password?"
    Then I should see "Please enter your username"

  Scenario: Resetting my password
    Given I have reached the password reset page
    And I enter the username "billbadger"
    And I click the button "Reset"
    Then I should see "Thanks! Please check your email for more instructions"

  Scenario: Creating a new password
    Given I have reset my password
    And clicked the email verification link
    Then I should see "Please enter your new password"

  Scenario: Trying to create a new password more than an hour after resetting it
      Given I have reset my password
      And an hour has passed
      And clicked the email verification link
      Then I should see "Sorry, your code is out of date, please try again"
