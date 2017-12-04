Given("he am on the login page") do
visit '/login'
end

Given("he fill in {string} with {string}") do |string, string2|
fill_in "Email", with: "signup@t.com"
fill_in "Password", with: "123"
end

Given("he click on {string}") do |string|
click_button "Log in"
end

When("he is on setup page") do
visit '/profiles/new'
end

Then("he should see {string}") do |string|
expect(page).to have_content("Please provide")
end

