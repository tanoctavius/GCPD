class CrimeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :felony
end
