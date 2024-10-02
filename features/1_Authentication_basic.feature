Feature: Authentication
	As an officer
	I want to create and access an account on the system
	In order to manage the system as an authenticated user

  Scenario: Login successful
    Given an initial setup
    When I go to the login page
    And I fill in "username" with "jgordon"
    And I fill in "password" with "secret"
    And I press "Log In"
    Then I should see "Logged in!"
		
  Scenario: Login failed
    Given an initial setup
    When I go to the login page
    And I fill in "username" with "jgordon"
    And I fill in "password" with "notsecret"
    And I press "Log In"
    Then I should see "Username and/or password is invalid"
		
  Scenario: Logout
    Given a logged in commissioner
    When I go to the home page
    And I click on the link "Logout"
    Then I should see "Logged out!"
	
	Scenario: Navigation exists to link resources
		Given a logged in commissioner
	  When I go to the home page
		And I click on the link "Investigations"
	  Then I should see "Open Investigations in GCPD"
	  When I go to the home page
		And I click on the link "Officers"
	  Then I should see "Active Officers in GCPD"
    When I go to the home page
		And I click on the link "Units"
	  Then I should see "Active Units in GCPD"
    When I go to the home page
	  Then I should not see "Assignments"

	
	