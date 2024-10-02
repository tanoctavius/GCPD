# require needed files
require './lib/tasks/helpers/crimes'
require './lib/tasks/helpers/units'
require './lib/tasks/helpers/officers'
require './lib/tasks/helpers/investigations'
require './lib/tasks/helpers/assignments'
require './lib/tasks/helpers/notes'
require './lib/tasks/helpers/suspects'


module Populator  
  include Populator::Crimes
  include Populator::Units
  include Populator::Officers
  include Populator::Investigations
  include Populator::Assignments
  include Populator::Notes
  include Populator::Suspects
end