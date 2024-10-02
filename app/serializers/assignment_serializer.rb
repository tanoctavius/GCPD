class AssignmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_date, :end_date

  attribute :officer do |object|
    OfficerSerializer.new(object.officer)
  end
end
