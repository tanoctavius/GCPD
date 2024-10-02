class SuspectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :added_on, :dropped_on

  attribute :criminal do |object|
    CriminalSerializer.new(object.criminal)
  end
end
