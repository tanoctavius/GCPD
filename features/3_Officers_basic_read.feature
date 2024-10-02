Feature: Read officers -- basic
  As an administrator
  I want to be able to read officer data
  So I can know my officers better

  Background:
    Given a logged in commissioner
  
  # READ METHODS
  Scenario: View all officers
    When I go to the officers page
    Then I should see "Active Officers in GCPD"
    And I should see "Name"
    And I should see "Rank"
    And I should see "Azeveda, Josh"
    And I should see "Detective"
    And I should see "Blake, John"
    And I should see "Detective Sergeant"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
    And I should not see "SSN"
    And I should not see "Ssn"
    And I should not see "ssn"
    And I should not see "Active duty?"
  
  Scenario: The officer name is a link to details
    When I go to the officers page
    And I click on the link "Sawyer, Maggie"
    And I should see "Maggie Sawyer"
    And I should see "Current unit:   Major Crimes"
    And I should see "Current rank:   Captain"
    And I should see "Active duty?   Yes"
    And I should see "Past Assignments"
    And I should see "Pussyfoot Heist"
    And I should not see "Lacey Towers Murder"
    And I should not see "Current Assignments"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View officer details
    When I go to John Blake's details
    Then I should see "John Blake"
    And I should see "Current unit:   Major Crimes"
    And I should see "Current rank:   Detective Sergeant"
    And I should see "Active duty?   Yes"
    And I should see "Current Assignments"
    And I should see "Lacey Towers Murder"
    And I should see "Past Assignments"
    And I should see "Pussyfoot Heist"
    And I should not see "Great Gotham Harbor Arson"
    And I should not see "Maggie Sawyer"
    And I should not see "Sawyer, Maggie"
    And I should not see "true"
    And I should not see "True"
