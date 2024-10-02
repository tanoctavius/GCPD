# require needed files
require './test/sets/crimes'
require './test/sets/units'
require './test/sets/criminals'
require './test/sets/officers'
require './test/sets/investigations'
require './test/sets/crime_investigations'
require './test/sets/assignments'
require './test/sets/investigation_notes'
require './test/sets/suspects'
require './test/sets/abilities'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Crimes
  include Contexts::Units
  include Contexts::Criminals
  include Contexts::Officers
  include Contexts::Investigations
  include Contexts::CrimeInvestigations
  include Contexts::Assignments
  include Contexts::InvestigationNotes
  include Contexts::Suspects
  include Contexts::Abilities

  def create_all
    # puts "Building context..."
    create_crimes
    # puts "Built crimes"
    create_units
    # puts "Built units"
    create_officers
    # puts "Built officers"
    create_investigations
    # puts "Built investigations"
    create_crime_investigations
    # puts "Link crimes to investigations"
    create_assignments
    # puts "Assign officers to investigations"
    create_investigation_notes
    # puts "Create investigations notes"
    create_criminals
    # puts "Built criminals"
    create_suspects
    # puts "Link criminals to investigations"
    # puts "Finished basic contexts"
  end

  def create_extended_context
    # puts "Building context..."
    create_crimes
    # puts "Building ..."
    create_units
    create_officers
    create_investigations
    create_crime_investigations
    create_assignments
    # puts "Building ..."
    create_investigation_notes
    create_rogues_gallery
    create_suspects
    create_more_units
    create_more_officers
    # puts "Building ..."
    create_holiday_investigation
    create_more_major_crimes_investigations
    create_more_murder_investigations
    create_unassigned_investigations
    # puts "Done."
  end

  def create_more_records
    create_more_units
    create_more_officers
    create_more_major_crimes_investigations
    create_unassigned_investigations
  end

  def destroy_all
    InvestigationNote.all.each{|x| x.delete}
    CrimeInvestigation.all.each{|x| x.delete}
    Assignment.all.each{|x| x.delete}
    Suspect.all.each{|x| x.delete}
    Investigation.all.each{|x| x.delete}
    Officer.all.each{|x| x.delete}
    Unit.all.each{|x| x.delete}
  end

  def destroy_units
    Unit.all.each{|x| x.delete}
  end

  def destroy_investigations
    InvestigationNote.all.each{|x| x.delete}
    CrimeInvestigation.all.each{|x| x.delete}
    Assignment.all.each{|x| x.delete}
    Suspect.all.each{|x| x.delete}
    Investigation.all.each{|x| x.delete}
  end

end