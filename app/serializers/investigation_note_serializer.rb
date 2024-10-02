class InvestigationNoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :date

  attribute :officer do |object|
    OfficerSerializer.new(object.officer)
  end
end
