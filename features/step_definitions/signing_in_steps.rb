Given(/^I have registered$/) do
  visit '/users/new'
  fill_in 'username', :with => "billbadger"
  fill_in 'email', :with => "bill@badger.com"
  fill_in 'first_name', :with => "Bill"
  fill_in 'last_name', :with => "Badger"
  fill_in 'password', :with => "Badgers"
  fill_in 'password_confirmation', :with => "Badgers"
  click_button("Register")
end

Given(/^I am on the sign in page$/) do
  visit '/sessions/new'
end

Given(/^I enter the username "(.*?)"$/) do |username|
  fill_in 'username', :with => username
end

Given(/^I enter the password "(.*?)"$/) do |password|
  fill_in 'password', :with => password
end
