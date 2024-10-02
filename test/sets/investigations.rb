require 'faker'

module Contexts
  module Investigations

    def create_investigations
      @lacey     = FactoryBot.create(:investigation)
      @pussyfoot = FactoryBot.create(:investigation, title: "Pussyfoot Heist", description: "Theft of $1.2 million in rare jewels.", crime_location: "2809 West 20th Street", date_opened: 20.months.ago.to_date, date_closed: 18.months.ago.to_date, solved: true, batman_involved: true)
      @harbor    = FactoryBot.create(:investigation, title: "Great Gotham Harbor Arson", description: "The burning of the Gotham Harbor. Over $24 million in property damage done.", crime_location: "Gotham Harbor", date_opened: 2.months.ago.to_date, date_closed: nil)
    end

    def create_more_murder_investigations
      10.times do |i|
        days_back = (3..100).to_a.sample
        street_address = Faker::Address.street_name
        investigator = @homicide_officers.sample
        batman_chance = (i%4 == 0 ? true : false)
        murder1_investigation = FactoryBot.create(:investigation, title: "Murder at #{street_address}", description: "A brutal premediated murder at #{street_address}.", crime_location: street_address, date_opened: days_back.days.ago.to_date, date_closed: nil, solved: false, batman_involved: batman_chance)
        officer_assignment = FactoryBot.create(:assignment, investigation: murder1_investigation, officer: investigator, start_date: days_back.days.ago.to_date)
        crime_investigation = FactoryBot.create(:crime_investigation, crime: @murder, investigation: murder1_investigation)
      end
    end

    def create_holiday_investigation
      mc_investigation = FactoryBot.create(:investigation, title: "The Holiday Murders", description: "A heinous series of murders and bombings among the Gotham underworld that align with major holidays.", crime_location: "Multiple Locations (see notes for each location)", date_opened: Date.new(2023,10,31), date_closed: nil, solved: false, batman_involved: true)
      officer_assignment = FactoryBot.create(:assignment, investigation: mc_investigation, officer: @jblake, start_date: Date.new(2023,10,31))
      officer_2_assignment = FactoryBot.create(:assignment, investigation: mc_investigation, officer: @jazeveda, start_date: Date.new(2023,11,23))
      officer_3_assignment = FactoryBot.create(:assignment, investigation: mc_investigation, officer: @hbullock, start_date: Date.new(2023,10,31), end_date: Date.new(2023,11,23))
      crime_investigation_1 = FactoryBot.create(:crime_investigation, crime: @murder, investigation: mc_investigation)
      crime_investigation_2 = FactoryBot.create(:crime_investigation, crime: @arson, investigation: mc_investigation)
      suspect_0 = FactoryBot.create(:suspect, investigation: mc_investigation, criminal: @two_face, added_on: Date.new(2023,12,25), dropped_on: nil)
      suspect_1 = FactoryBot.create(:suspect, investigation: mc_investigation, criminal: @rfalcone, added_on: Date.new(2023,10,31), dropped_on: Date.new(2023,11,24))
      suspect_2 = FactoryBot.create(:suspect, investigation: mc_investigation, criminal: @maroni, added_on: Date.new(2023,11,24), dropped_on: nil)
    end

    def create_more_major_crimes_investigations
      12.times do |i|
        days_back = (3..100).to_a.sample
        street_address = Faker::Address.street_name
        investigator = @mc_stars.sample
        batman_chance = (i%3 == 0 ? true : false)
        crime_options = [["Multiple Homicide", @murder], ["Theft", @robbery], ["Arson", @arson]]
        this_crime = crime_options.sample
        mc_investigation = FactoryBot.create(:investigation, title: "#{this_crime[0]} at #{street_address}", description: "A heinous crime at #{street_address}.", crime_location: "#{rand(5000)} #{street_address}", date_opened: days_back.days.ago.to_date, date_closed: nil, solved: false, batman_involved: batman_chance)
        officer_assignment = FactoryBot.create(:assignment, investigation: mc_investigation, officer: investigator, start_date: days_back.days.ago.to_date)
        crime_investigation = FactoryBot.create(:crime_investigation, crime: this_crime[1], investigation: mc_investigation)
        suspect_1 = FactoryBot.create(:suspect, investigation: mc_investigation, criminal: Criminal.all.to_a.sample)
      end
    end

    def create_unassigned_investigations
      @wtarson = FactoryBot.create(:investigation, title: "Wayne Tower Arson", description: "The burning of the Wayne Tower. Early intervention kept property damage limited to $1.2 million.", crime_location: "Wayne Towers", date_opened: 1.day.ago.to_date, date_closed: nil, solved: false)
      @scbarson = FactoryBot.create(:investigation, title: "Soder Cola Building Arson", description: "Arsonists torched the Soder Cola Building completely.  Initial property damage estimated at $5.9 million.", crime_location: "Soder Cola Building", date_opened: 3.days.ago.to_date, date_closed: nil, solved: false)
      @globe_murder = FactoryBot.create(:investigation, title: "Gotham Globe Murder", description: "A brutal premediated murder at the Gotham Globe.", crime_location: "Gotham Globe Building", date_opened: 2.days.ago.to_date, date_closed: nil, solved: false, batman_involved: true)
    end

  end
end