#load "~/https:/github.com/williamJ1/jobmine/jobmine/jobmine/db/seeds.rb"

Given("I am on the login page") do
visit '/login'
end

Given("I fill in {string} with {string}") do |string, string2|
fill_in "Email", with: "Stephen_Smith@t.com"
fill_in "Password", with: "123"
end

When("I click on {string}") do |string|
click_button "Log in" 
end


Then("I should be on the teenager home page") do

end

Then("I should see {string}") do |string|
 expect(page).to have_content("Open Jobs")
end

