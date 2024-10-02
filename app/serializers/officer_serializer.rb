class OfficerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :unit_id, :rank, :role
end
