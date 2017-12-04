Feature:set_profile
 
Scenario: set up profile
Given he am on the login page
  And he fill in "Email" with "Stephen_Smith@t.com"
  And he fill in "Password" with "123"
  And he click on "Log in"
When he is on setup page
Then he should see "Please provide more info"


