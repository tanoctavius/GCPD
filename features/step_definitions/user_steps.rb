require './test/contexts'
include Contexts

Given /^an initial setup$/ do
  create_all
  # change one date to known date
  @lacey.date_opened = "2023-04-23"
  @lacey.save
  # create some unassigned cases
  wtarson = FactoryBot.create(:investigation, title: "Wayne Tower Arson", description: "The burning of the Wayne Tower. Early intervention kept property damage limited to $1.2 million.", crime_location: "Wayne Towers", date_opened: 1.day.ago.to_date, date_closed: nil, solved: false)
  wtarson_crime_1 = FactoryBot.create(:crime_investigation, investigation: wtarson, crime: @arson)
  scbarson = FactoryBot.create(:investigation, title: "Soder Cola Building Arson", description: "Arsonists torched the Soder Cola Building completely.  Initial property damage estimated at $5.9 million.", crime_location: "Soder Cola Building", date_opened: 3.days.ago.to_date, date_closed: nil, solved: false)
  scbarson_crime_1 = FactoryBot.create(:crime_investigation, investigation: scbarson, crime: @arson)
  murder1a_investigation = FactoryBot.create(:investigation, title: "Gotham Globe Affair", description: "A brutal premediated murder at the Gotham Globe.", crime_location: "Gotham Globe Building", date_opened: 2.days.ago.to_date, date_closed: nil, solved: false, batman_involved: false)
  murder1a_ci = FactoryBot.create(:crime_investigation, crime: @murder, investigation: murder1a_investigation)
end

Given /^more data$/ do
  create_more_records
  @harbor.date_opened = "2023-01-23"
  @harbor.save
end

Given /^no setup yet$/ do
  # assumes initial setup already run as background
  destroy_all
end

Given /^no units yet$/ do
  # assumes initial setup already run as background
  destroy_units_except_hq
end

Given /^no investigations yet$/ do
  # assumes initial setup already run as background
  destroy_investigations
end

Given /^a logged in commissioner$/ do
  step "an initial setup"
  visit login_url
  fill_in "Username", :with => "jgordon"
  fill_in "Password", :with => "secret"
  click_button "Log In"
end
