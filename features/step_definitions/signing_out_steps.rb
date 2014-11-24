Then(/^I should not see "(.*?)"$/) do |message_text|
  expect(page).not_to have_content(message_text)
end
