Feature: post job
  try to post a new job
  As a employer

Scenario: employer post jobs
  Given employer is on the signup page
  And employer fill in "Email" with "test@e.com"
  And employer fill in "Password" with "123"
  And employer fill in "Password confirmation" with "123"
  And employer click on "Sign Up"
 And employer fills in "Address" with "801 Bay Street"
 And employer fills in "Phone num" with "6478851988"
 And employer select in "Gender" with "male"
 And employer select in "User type" with "empolyer"
 And employer press on "Save profile !"
When employer goes to job page
And employer clicks on "Post new job"
And employer put in "Name" with "Dog walking service"
And employer put in "Description" with "Walking my dog everyday for ten minutes"
And employer put in "Begin date time" with "2017/12/15"
And employer put in "End date time" with "2017/12/20"
And employer put in "Location" with "Bahen"
And employer put in "Hour rate" with "15"
And employer presses on "Create job"

Then employer should see "Job was successfully created"


