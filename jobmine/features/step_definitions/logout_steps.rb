Given("she is on the login page") do
visit '/login'
end

Given("she fill in {string} with {string}") do |string, string2|
fill_in "Email", with: "Stephen_Smith@t.com"
fill_in "Password", with: "123"
end

Given("she click on {string}") do |string|
click_button "Log in"
end

When("she press on {string}") do |string|
click_link "Log out"
end

Then("She should see {string}") do |string|
 expect(page).to have_content("You have successfully logged out!")
end

