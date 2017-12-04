When(/^I go to the homepage$/) do
  visit'/'
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Home")
end
