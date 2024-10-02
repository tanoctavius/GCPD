Feature: Read units -- basic
  As an administrator
  I want to be able to read unit data
  So I access to key unit information

  Background:
    Given a logged in commissioner

  # READ METHODS
  Scenario: View all units
    When I go to the units page
    Then I should see "Unit"
    And I should see "Headquarters"
    And I should see "Homicide"
    And I should see "Major Crimes"
    And I should see "Active"
    And I should see "Yes"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"


  Scenario: The unit name is a link to details
    When I go to the units page
    And I click on the link "Homicide"
    Then I should see "There are no active officers currently in this unit"


  Scenario: View unit details
    When I go to the Major Crimes details page
    Then I should see "Active Officers in Major Crimes Unit"
    And I should see "Name"
    And I should see "Sawyer, Maggie"
    And I should see "Blake, John"
    And I should see "Rank"
    And I should see "Detective Sergeant"
    And I should see "Captain"
    And I should see "Active Assignments"
    And I should see "1"
    And I should not see "Homicide"
    And I should not see "true"
    And I should not see "True"
