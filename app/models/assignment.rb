class Assignment < ApplicationRecord
  include Validations
  include Deletions

  # Relationships
  belongs_to :investigation
  belongs_to :officer
  attr_accessor :from

  # Scopes
  scope :current, -> { where(end_date: nil) }
  scope :past, -> { where.not(end_date: nil) }
  scope :chronological, -> { order(:start_date) }
  scope :by_officer, -> { joins(:officer).order('officers.last_name, officers.first_name') }
  scope :for_date,      ->(date){ where('start_date <= ? AND (end_date > ? OR end_date IS NULL)', date, date) }

  # Validations
  validates_presence_of :officer_id, :investigation_id, :start_date
  validates_date :start_date, on_or_before: -> { Date.current }
  validates_date :end_date, on_or_after: :start_date, allow_blank: true
  validate -> { is_active_in_system(:officer) }
  validate -> { is_an_open_investigation() }, on: :create
  validate :assignment_is_not_a_duplicate, on: :create

  # Callback - to prevent deletions
  before_destroy -> { cannot_destroy_object() }

  # Other methods
  def terminate
    return false unless self.end_date.nil?
    self.end_date = Date.current
    self.save
    self.reload
  end

  private
    def assignment_is_not_a_duplicate
      if assignment_exists? && assignment_is_current?
        errors.add(:investigation_id, "this assignment already exists.")
      end
    end

    def assignment_exists?
      !Assignment.where(investigation_id: self.investigation_id, officer_id: self.officer_id).current.empty?
    end

    def assignment_is_current?
      self.end_date.nil?
    end
end
