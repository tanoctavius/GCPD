class InvestigationDetailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :crime_location, :date_opened, :date_closed, :solved, :batman_involved

  attribute :current_assignments do |object|
    object.assignments.chronological.reverse.map do |assignment|
      AssignmentSerializer.new(assignment)
    end
  end

  attribute :notes do |object|
    object.investigation_notes.chronological.reverse.map do |note|
      InvestigationNoteSerializer.new(note)
    end
  end

  attribute :crimes do |object|
    object.crimes.active.alphabetical.map do |crime|
      CrimeSerializer.new(crime)
    end
  end

  attribute :suspects do |object|
    object.suspects.chronological.reverse.map do |suspect|
      SuspectSerializer.new(suspect)
    end
  end
end
