class Officer < ApplicationRecord
  # because officers have to log into the system
  has_secure_password

  # Modules to extend functionality
  include Validations
  include OfficerAuthentication
  include Activeable::InstanceMethods
  extend Activeable::ClassMethods

  # Relationships
  belongs_to :unit
  has_many :assignments
  has_many :investigations, through: :assignments
  has_many :investigation_notes
  attr_accessor :destroyable

  # Enums
  enum :role, { officer: 1, chief: 2, commish: 3 }, scopes: true, default: :officer, suffix: true

  # Scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :for_unit, -> (unit_id){ where(unit_id: unit_id) }
  scope :detectives, -> { where('rank LIKE ?', "%detective%") }
  scope :search, ->(term) { where('first_name LIKE ? OR last_name LIKE ?', "#{term}%", "#{term}%") }
  
  # Validations
  validates_presence_of :first_name, :last_name, :unit_id, :role
  validates_format_of :ssn, with: /\A\d{3}[- ]?\d{2}[- ]?\d{4}\z/, message: "should be 9 digits and delimited with dashes only"
  validates_uniqueness_of :ssn
  validates_inclusion_of :rank, in: %w[Officer Sergeant Detective Detective\ Sergeant Lieutenant Captain Commissioner], message: "is not an option", allow_blank: true
  validate -> { is_active_in_system(:unit) }

  validates_inclusion_of :role, in: %w[officer chief commish], message: "is not an option"
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, on: :create, message: 'does not match'
  validates_length_of :password, minimum: 4, message: 'must be at least 4 characters long', allow_blank: true

  # Other methods
  RANKS_LIST = [['Officer', 'Officer'],['Sergeant', 'Sergeant'],['Detective', 'Detective'],['Detective Sergeant', 'Detective Sergeant'],['Lieutenant', 'Lieutenant'],['Captain', 'Captain'],['Commissioner', 'Commissioner']].freeze

  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
  
  def current_assignments
    current = self.assignments.select{|a| a.end_date.nil?}
    return nil if current.empty?
    current
  end

  # Callbacks
  before_save    -> { strip_nondigits_from(:ssn) }

  include OfficerDeletion
  before_destroy -> { handle_deletion_request() }
  # after_rollback -> { handle_deletion_failure() }
  before_save    -> { remove_assignments_from_inactive_officer() }
end
