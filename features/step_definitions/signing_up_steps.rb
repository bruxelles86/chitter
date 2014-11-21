Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |message_text|
  expect(page).to have_content(message_text)
end

Given(/^I click "(.*?)"$/) do |link_text|
  click_link(link_text)
end

Given(/^I enter a username "(.*?)"$/) do |username|
  fill_in 'username', :with => "billbadger"
end

Given(/^I enter an email "(.*?)"$/) do |email|
  fill_in 'email', :with => "bill@badger.com"
end

Given(/^I enter a first name "(.*?)"$/) do |name|
  fill_in 'first_name', :with => "Bill"
end

Given(/^I enter a last name "(.*?)"$/) do |name|
  fill_in 'last_name', :with => "Badger"
end

Given(/^I enter a password "(.*?)"$/) do |password|
  fill_in 'password', :with => "Test"
end

Given(/^I enter a password confirmation "(.*?)"$/) do |password|
  fill_in 'password_confirmation', :with => "Test"
end

Given(/^I click the button "(.*?)"$/) do |button_text|
  click_button(button_text)
end
