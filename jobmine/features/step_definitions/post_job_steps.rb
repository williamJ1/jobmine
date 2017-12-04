Given("employer is on the signup page") do
visit '/signup'
end

Given("employer fill in {string} with {string}") do |string, string2|
fill_in "Email", with: "test@e.com"
fill_in "Password", with: "123"
fill_in "Password confirmation", with: "123"
end

Given("employer click on {string}") do |string|
click_button "Sign up"
end

Given("employer fills in {string} with {string}") do |string, string2|
fill_in "Address", with: "801 Bay st",visible: false
fill_in "Phone num", with: "6478851988",visible: false
end

Given("employer select in {string} with {string}") do |string, string2|
select "female", :from => "Gender"
select "employer", :from => "User type"

end

Given("employer press on {string}") do |string|
click_button "Save profile !"
end

When("employer goes to job page") do
visit '/jobs'
end

When("employer clicks on {string}") do |string|
click_link "Post new job"
end

When("employer put in {string} with {string}") do |string, string2|
fill_in "Name", with: "Dog walking service",visible: false
fill_in "Description", with: "Walking my dog everyday for ten minutes",visible: false
fill_in "Begin date time", with: "2017/12/15",visible: false
fill_in "End date time", with: "2017/12/20",visible: false
fill_in "Location", with: "Bahen",visible: false
fill_in "Hour rate", with: "15",visible: false
end

When("employer presses on {string}") do |string|
click_button "Create job"
end


Then("employer should see {string}") do |string|
expect(page).to have_content("Job was successfully created")
end

