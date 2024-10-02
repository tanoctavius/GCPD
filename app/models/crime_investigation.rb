class CrimeInvestigation < ApplicationRecord
  include Validations

  # Relationships
  belongs_to :crime
  belongs_to :investigation

  # Scopes
  scope :for_crime, -> (crime){ where(crime_id: crime.id) }
  scope :for_investigation, -> (investigation){ where(investigation_id: investigation.id) }
  
  # Validations
  validates_presence_of :crime_id, :investigation_id
  validate -> { is_active_in_system(:crime) }
  validate -> { is_an_open_investigation() }

end
