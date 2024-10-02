Feature: Read units -- advanced
  As an administrator
  I want to be able to read more information on units
  So I can effective track unit effectiveness in GCPD

  Background:
    Given a logged in commissioner
    Given more data

  # READ METHODS
  Scenario: Advanced unit statistics displayed
    When I go to the Major Crimes details page
    # in a card with id "stats"
    Then I should see "Statistics for Major Crimes Unit" within "#stats.card"
    And I should see "Number of Active Officers:   13" within "#stats.card"
    And I should see "Number of Open Cases:   14"
    And I should see "Number of Closed Cases:   1"
    And I should see "Cases Involving Batman:   5"

  Scenario: Active officers displayed in a card
    When I go to the Major Crimes details page
    # in a card with id "officers"
    Then I should see "Active Officers in Major Crimes Unit" within "#officers.card"
    And I should see "Name" within "#officers.card"
    And I should see "Bartlett, Jane"
    And I should see "Blake, John"
    And I should see "Rank"
    And I should see "Detective"
    And I should see "Detective Sergeant"

  Scenario: Active officers list is paginated
    When I go to the Major Crimes details page
    # in a card with id "officers"
    Then I should see "Active Officers in Major Crimes Unit" within "#officers.card"
    And I should see "Blake, John"
    And I should see "Previous"
    And I should see "Next"
    And I should not see "Sawyer, Maggie"
    When I click on the link "Next"
    Then I should see "Sawyer, Maggie"
