Feature: Read investigations -- basic
  As an administrator
  I want to be able to read a list of investigations
  So I can effective track crimes in Gotham City

  Background:
    Given a logged in commissioner

  # READ METHODS
  Scenario: No investigations yet
    Given no investigations yet
    When I go to the investigations page
    Then I should see "No open cases at this time"
    And I should not see "Title"
    And I should not see "Date open"
    And I should not see "Lacey Towers Murder"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all investigations
    When I go to the investigations page
    Then I should see "Open Investigations in GCPD"
    And I should see "Title"
    And I should see "Date open"
    And I should see "Great Gotham Harbor Arson"
    And I should see "Lacey Towers Murder"
    And I should see "04/23/23"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
    And I should not see "2023-04-23"



