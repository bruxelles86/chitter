Feature: Signing in to Chitter
  In order to post messages to Chitter
  As a registered user
  I must be able to sign in

  Scenario: Reaching the sign in page
    Given I am on the homepage
    And I click the link "Sign in"
    Then I should see "Please enter your username"

  Scenario: Signing in to the site with correct credentials
    Given I have registered
    And I am on the sign in page
    And I enter the username "billbadger"
    And I enter the password "Badgers"
    And I click the button "Sign in"
    Then I should see "Welcome to Chitter Bill"

  Scenario: Signing in to the site with incorrect credentials
    Given I have registered
    And I am on the sign in page
    And I enter the username "billbadger"
    And I enter the password "WrongPass"
    And I click the button "Sign in"
    Then I should see "Sorry, your email or password was incorrect. Please try again."
