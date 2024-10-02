Feature: Read officers -- medium
  As an administrator
  I want better formatting of officer data
  So I can read SSNs easily and have lists paginated

  Background:
    Given a logged in commissioner
    Given more data
  
  # READ METHODS
  Scenario: View all officers with pagination
    When I go to the officers page
    Then I should see "Active Officers in GCPD"
    And I should see "Name"
    And I should see "Rank"
    And I should see "Akins, Michael"
    And I should see "Captain"
    And I should see "Blake, John"
    And I should see "Detective Sergeant"
    And I should see "Bartlett, Jane"
    And I should see "Detective"
    And I should not see "Sawyer, Maggie"
    And I should not see "Xue, Stacey"

  Scenario: Viewing Jim Gordon's SSN and no past assignments
    When I go to Jim Gordon's details
    Then I should see "Jim Gordon"
    And I should see "Current unit:   Headquarters"
    And I should see "Current rank:   Commissioner"
    And I should see "SSN:   064-23-0511"
    And I should see "Active duty?   Yes"
    And I should not see "Current Assignments"
    And I should not see "Past assignments"
