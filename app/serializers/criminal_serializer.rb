class CriminalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :aka, :convicted_felon, :enhanced_powers, :notes
end
