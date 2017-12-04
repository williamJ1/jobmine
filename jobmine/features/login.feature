Feature: Login 
  In order to read the page
  As a viewer
  I want to log in

Scenario: login with valid credentials
  Given I am on the login page
  And I fill in "Email" with "Stephen_Smith@t.com"
  And I fill in "Password" with "123"
  When I click on "Log in"
Then I should be on the teenager home page
And I should see "Open Jobs"
