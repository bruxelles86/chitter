Feature: Signing up for Chitter
  In order to post messages on Chitter
  As a registered user
  I must be able to register

  Scenario: Visiting the site for the first time
    Given I am on the homepage
    Then I should see "Welcome to Chitter"
    And I should see "Sign up"

  Scenario: Signing up to the site with passwords that match
    Given I am on the homepage
    And I click "Sign up"
    And I enter a username "billbadger"
    And I enter an email "bill@badger.com"
    And I enter a first name "Bill"
    And I enter a last name "Badger"
    And I enter a password "Badgers"
    And I enter a password confirmation "Badgers"
    And I click the button "Register"
    Then I should see "Welcome to Chitter Bill"

  Scenario: Signing up to the site with passwords that don't match
    Given I am on the homepage
    And I click "Sign up"
    And I enter a username "billbadger"
    And I enter an email "bill@badger.com"
    And I enter a first name "Bill"
    And I enter a last name "Badger"
    And I enter a password "Test"
    And I enter a password confirmation "Wrong"
    And I click the button "Register"
    Then I should see "Password does not match the confirmation"
