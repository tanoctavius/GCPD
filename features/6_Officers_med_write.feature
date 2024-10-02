Feature: Write officers -- medium
  As an administrator
  I want to be able to create and edit officers
  So that I can make officer adjustments as needed

  Background:
    Given a logged in commissioner
  
  # CREATE METHODS
  Scenario: Creating a new officer is successful
    When I go to the new officer page
    And I fill in "officer_first_name" with "Ed"
    And I fill in "officer_last_name" with "Gruberman"
    And I select "Detective" from "officer_rank"
    And I select "Major Crimes" from "officer_unit_id"
    And I fill in "officer_ssn" with "143-95-7541"
    And I select "Officer" from "officer_role"
    And I fill in "officer_username" with "egruberman"
    And I fill in "officer_password" with "secret"
    And I fill in "officer_password_confirmation" with "secret"
    And I press "Create Officer"
    Then I should see "Successfully created Ed Gruberman."
    And I should see "Officer Information for Ed Gruberman"
    And I should see "Current unit:   Major Crimes"

  Scenario: Creating an invalid officer fails
    When I go to the new officer page
    And I fill in "officer_first_name" with "Logan"
    And I fill in "officer_last_name" with ""
    And I select "Lieutenant" from "officer_rank"
    And I select "Major Crimes" from "officer_unit_id"
    And I fill in "officer_ssn" with "999-99-9999"
    And I select "Officer" from "officer_role"
    And I fill in "officer_username" with "wolverine"
    And I fill in "officer_password" with "secret"
    And I fill in "officer_password_confirmation" with "secret"
    And I press "Create Officer"
    Then I should see "can't be blank"
    And I should see "New Officer"
    And I should not see "Current unit"

  # UPDATE METHODS
  Scenario: Promoting an officer is successful
    When I go to edit John Blake's record
    Then I should see "Edit Officer"
    When I select "Lieutenant" from "officer_rank"
    And I press "Update Officer"
    And I should see "Officer Information for John Blake"
    And I should see "Current rank:   Lieutenant"