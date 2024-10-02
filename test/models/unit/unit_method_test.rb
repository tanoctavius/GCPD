require 'test_helper'

class UnitMethodTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_units
    end

    should "have make_active and make_inactive methods" do
      assert @major_crimes.active
      @major_crimes.make_inactive
      @major_crimes.reload
      deny @major_crimes.active
      @major_crimes.make_active
      @major_crimes.reload
      assert @major_crimes.active
    end

    should "be able to calculate the number of active officers in the unit" do
      create_officers
      assert_equal 3, @major_crimes.number_of_active_officers
      # doesn't get Loeb in HQ, who is inactive...
      assert_equal 1, @headquarters.number_of_active_officers
    end

    should "be able to calculate the number of open investigations the unit is part of" do
      create_officers
      create_crimes
      create_investigations
      create_assignments
      # doesn't include the closed cases, like Pussyfoot
      assert_equal 2, @major_crimes.number_of_unique_open_investigations
      # now add Blake to harbor case; count should not go up
      assert_equal 1, @harbor.assignments.count
      harbor_jblake      = FactoryBot.create(:assignment, investigation: @harbor, officer: @jblake)
      @harbor.reload
      assert_equal 2, @harbor.assignments.count
      @major_crimes.reload  # to be sure...
      assert_equal 2, @major_crimes.number_of_unique_open_investigations
    end

    should "be able to calculate the number of closed investigations the unit is part of" do
      create_officers
      create_investigations
      create_assignments
      # similar to above, doesn't include the open cases -- otherwise would be 3 cases
      assert_equal 1, @major_crimes.number_of_unique_closed_investigations
    end

    should "be able to calculate the number of unit investigations Batman has been involved with" do
      create_officers
      create_crimes
      create_investigations
      create_assignments
      # Pussyfoot case already involves Batman and assigned to MCU; create additional that is not assigned
      globe_murder = FactoryBot.create(:investigation, title: "Gotham Globe Affair", description: "A brutal premediated murder at the Gotham Globe.", crime_location: "Gotham Globe Building", date_opened: 2.days.ago.to_date, date_closed: nil, solved: false, batman_involved: true)
      globe_crime = FactoryBot.create(:crime_investigation, crime: @murder, investigation: globe_murder)
      # doesn't pick up the new Batman case since not a MCU case
      @major_crimes.reload
      assert_equal 1, @major_crimes.number_of_unique_investigations_involving_batman
    end

  end
end