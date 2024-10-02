class InvestigationNote < ApplicationRecord
  include Validations
  include Deletions

  # Relationships
  belongs_to :investigation
  belongs_to :officer

  # Scopes
  scope :chronological, -> { order(:date) }
  scope :by_officer, -> { joins(:officer).order('officers.last_name, officers.first_name') }
  scope :for_officer, -> (officer){ where(officer_id: officer.id) }
  
  # Validations
  validates_presence_of :investigation_id, :officer_id, :content
  validate -> { is_an_open_investigation() }
  validate :officer_is_assigned_to_investigation

  # Callback
  before_create :set_date_to_current_date
  before_destroy -> { cannot_destroy_object() }

  private
  def officer_is_assigned_to_investigation
    return true if self.officer.nil?
    current_investigations = self.officer.assignments.current.map{|a| a.investigation}
    unless current_investigations.include?(self.investigation)
      self.errors.add(:investigation, "is not currently assigned to this investigation")
    end
  end

  def set_date_to_current_date
    self.date = Date.current
  end
end
