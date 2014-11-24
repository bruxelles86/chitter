Given(/^I fill in the box "(.*?)"$/) do |box_name|
  fill_in box_name, :with => "Peep, peep"
end
