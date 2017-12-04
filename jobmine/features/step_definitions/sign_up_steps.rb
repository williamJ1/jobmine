Given("you am on the signup page") do
visit '/signup'
end

Given("you fill in {string} with {string}") do |string,string2|
fill_in "Email", with: "signup@t.com"
fill_in "Password", with: "123"
fill_in "Password confirmation", with: "123"
end

When("you click on {string}") do |string|
click_button "Sign up"
end

Then("you should be on the teenager profile set up page") do
end

Then("you should see {string}") do |string|
 expect(page).to have_content("Please provide more info here!")
end
