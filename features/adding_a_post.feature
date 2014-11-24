Feature: Posting to Chitter
  In order to use Chitter
  As a signed-in user
  I must be able make a new post

  Scenario: Making a new post
    Given I have registered
    And I am on the homepage
    And I fill in the box "post_text"
    And I click the button "Peep"
    Then I should see "Nice one!"
