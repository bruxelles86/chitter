Given(/^I have written a peep with the text "(.*?)"$/) do |peep_text|
  step("I have registered")
  visit ('/')
  fill_in 'post_text', :with => peep_text
  click_button("Peep")
end
