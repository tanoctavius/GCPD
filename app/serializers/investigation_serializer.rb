class InvestigationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :crime_location, :date_opened, :date_closed, :solved, :batman_involved
end