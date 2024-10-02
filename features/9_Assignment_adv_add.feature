Feature: Add Assignment from Officer -- advanced
  As an administrator
  I want to be able to make an assignment from officers#show
  So I can effective balance the assignment workload

  Background:
    Given a logged in commissioner
    Given more data
  
  # READ METHODS
  Scenario: Display an officer's past and current assignments
    When I go to Jim Gordon's details
    Then I should see "Jim Gordon"
    # Gordon has no assignments
    And I should not see "Current Assignments"
    # but this guy does...
    When I go to John Blake's details
    Then I should see "John Blake"
    # in a card with id 'current_assignments'
    And I should see "Current Assignments" within "#current_assignments.card"
    And I should see "Lacey Towers Murder"
    And I should see "Starting"
    # dates of assignment can vary so won't check format here
    # in a card with id 'past_assignments'
    And I should see "Past Assignments" within "#past_assignments.card"
    And I should see "Pussyfoot Heist"
    And I should see "Ending"
    # dates of assignment can vary so won't check format here

  # CREATE METHODS
  Scenario: Can add an assignment from officer details page
    When I go to John Blake's details
    And I click on the link "Add a new assignment"
    Then I should see "New Assignment"
    And I should see "For Officer: Blake, John"
    When I select "Gotham Globe Affair" from "assignment_investigation_id"
    And I press "Create Assignment"
    Then I should see "John Blake"
    And I should see "Current Assignments"
    And I should see "Gotham Globe Affair"
