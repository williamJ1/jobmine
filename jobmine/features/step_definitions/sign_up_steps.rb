Given("you am on the signup page") do
visit '/signup'
end

Given("you fill in {string} with {string}") do |string,string2|
fill_in "Email", with: "signup@t.com"
fill_in "Password", with: "123"
fill_in "Password confirmation", with: "123"
end

Given("you click on {string}") do |string|
click_button "Sign up"
end

When("you are on the setup profile page") do
visit '/profiles/new'
end

When("you will see {string}") do |string|
expect(page).to have_content("Please provide more info here!")
end

When("you fills in {string} with {string}") do |string, string2|
fill_in "Address", with: "801 Bay st",visible: false
fill_in "Phone num", with: "6478851988",visible: false
end

When("you select in {string} with {string}") do |string, string2|
select "male", :from => "Gender"
select "teenager", :from => "User type"
end

When("you press on {string}") do |string|
click_button "Save profile !"
end

Then("you should see {string}") do |string|
 expect(page).to have_content("User profile:")
end

