Feature: sign up
  youn order to create a new user
  As teenager

Scenario: sign up teenager
  Given you am on the signup page
  And you fill in "Email" with "signup@t.com"
  And you fill in "Password" with "123"
  And you fill in "Password confirmation" with "123"
  When you click on "Sign Up"
Then you should be on the teenager profile set up page
And you should see "Please provide more info here!"

