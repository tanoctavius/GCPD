Feature: Write units -- medium
  As an administrator
  I want to be able to create and edit units
  So that I can make unit adjustments as needed

  Background:
    Given a logged in commissioner
  
  # CREATE METHODS
  Scenario: Creating a new unit is successful
    When I go to the new unit page
    And I fill in "unit_name" with "D.M.A."
    And I press "Create Unit"
    Then I should see "Successfully added D.M.A. to GCPD."
    And I should see "Active Units in GCPD"
    And I should see "Major Crimes"
    And I should see "D.M.A."

  Scenario: Creating a unit that already exists fails
    When I go to the new unit page
    And I fill in "unit_name" with "Major Crimes"
    And I press "Create Unit"
    Then I should see "has already been taken"
    And I should see "New Unit"

  # # UPDATE METHODS
  Scenario: Editing an existing unit is successful
    When I go to edit the Major Crimes page
    Then I should see "Edit Unit"
    And I fill in "unit_name" with "M.C.U."
    And I press "Update Unit"
    Then I should see "Updated unit information"
    And I should see "Active Officers in M.C.U."