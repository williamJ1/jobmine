Feature: sign up
  youn order to create a new user
  As teenager

Scenario: sign up teenager
  Given you am on the signup page
  And you fill in "Email" with "signup@t.com"
  And you fill in "Password" with "123"
  And you fill in "Password confirmation" with "123"
  And you click on "Sign Up"
When you are on the setup profile page
 And you will see "Please provide more info here!"
 And you fills in "Address" with "801 Bay Street"
 And you fills in "Phone num" with "6478851988"
 And you select in "Gender" with "male"
 And you select in "User type" with "teengaer"
 And you press on "Save profile !"
Then you should see "User profile:"

