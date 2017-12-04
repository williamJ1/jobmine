Feature: Logout
  I want to log out

Scenario: logout correctly
  Given  she is on the login page
  And she fill in "Email" with "Stephen_Smith@t.com"
  And she fill in "Password" with "123"
  And she click on "Log in"
When she press on "Log out"
Then She should see "You have successfully logged out!"
