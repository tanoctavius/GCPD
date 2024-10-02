module OfficerDeletion
  def handle_deletion_request 
    check_if_ever_given_an_assignment()
    if self.errors.present?
      self.destroyable = false
      throw(:abort)
    end
  end

  # def handle_deletion_failure
  #   if self.destroyable == false
  #     convert_to_inactive()
  #     remove_current_assignments()
  #   end
  # end

  private
    def check_if_ever_given_an_assignment
      unless self.assignments.empty?
        errors.add(:base, "Officer cannot be deleted because of previous assignments, but officer status has been set to inactive.")
      end
    end

    # def convert_to_inactive
    #   self.make_inactive
    # end
  
    def remove_current_assignments
      self.assignments.current.each do |assignment|
        assignment.end_date = Date.current
        assignment.save
      end
    end

    def remove_assignments_from_inactive_officer
      return true if self.active 
      remove_current_assignments
    end

end