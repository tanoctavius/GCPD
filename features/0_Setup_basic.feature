Feature: Standard Business
  As a user
  I want to be able to view certain information
  So I can have basic confidence in the system

  Background:

  Scenario: Do not see the default rails page
    When I go to the home page
    Then I should not see "You're riding Ruby on Rails!"
    And I should not see "About your application's environment"
    And I should not see "Create your database"

  Scenario: View 'About the GCPD'
    When I go to the About Us page
    Then I should see "About"
    And I should not see "Lorem"
    And I should not see "lorem"
    And I should not see "ipsum"

  Scenario: View 'Contact Us'
    When I go to the Contact Us page
    Then I should see "Contact"
    And I should not see "Lorem"
    And I should not see "lorem"
    And I should not see "ipsum"

  Scenario: View 'Privacy Policy'
    When I go to the Privacy page
    Then I should see "Privacy"
    And I should not see "Lorem"
    And I should not see "lorem"
    And I should not see "ipsum"

  Scenario: View webmaster information in footer
    When I go to the home page
    Then I should see "Webmaster"
    # And I should see "YOUR NAME HERE"
    And I should not see "Lorem"
    And I should not see "lorem"
    And I should not see "ipsum"
