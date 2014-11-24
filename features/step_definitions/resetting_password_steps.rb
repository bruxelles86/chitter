Given(/^I have reached the password reset page$/) do
  step("I have registered")
  visit '/users/password/reset'
end

Given(/^I have reset my password$/) do
  step("I have reached the password reset page")
  fill_in 'username', :with => "billbadger"
  click_button("Reset")
end

Given(/^clicked the email verification link$/) do
  user = User.first
  token = user.password_token
  visit "/users/password/reset/#{token}"
end

Given(/^an hour has passed$/) do
  over_and_hour_before = Time.now + 3610
  Timecop.travel(over_and_hour_before)
end
