Feature: Viewing Posts
  In order to interact with Chitter
  As a visitor to the site
  I should be able to see peeps

  Scenario: Viewing peeps
    Given I have written a peep with the text "Hello world!"
    And I am on the homepage
    Then I should see "Recent Peeps"
    And I should see "Hello world!"
