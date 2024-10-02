class Crime < ApplicationRecord
  include Deletions
  include Activeable::InstanceMethods
  extend Activeable::ClassMethods
  
  # Relationships
  has_many :crime_investigations
  has_many :investigations, through: :crime_investigations
  
  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :felonies, -> { where(felony: true) }
  scope :misdemeanors, -> { where.not(felony: true) }

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Callback - to prevent deletions
  before_destroy -> { cannot_destroy_object() }
end
