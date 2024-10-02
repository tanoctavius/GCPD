# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(officer)
    officer ||= Officer.new # i.e., a guest officer
    
    # set authorizations for different officer roles
    if officer.commish_role?
      # they get to do it all
      can :manage, :all
    end
      
    if officer.chief_role?
      can :read, :all
      can :manage, Investigation
      can :manage, InvestigationNote
      can :manage, CrimeInvestigation
      can :manage, Assignment
      can :read, Unit
      can :update, Unit do |this_unit|
        this_unit.id == officer.unit_id
      end
      can :manage, Officer do |this_officer|
        my_officers = officer.unit.officers.active.map(&:id)
        my_officers.include?(this_officer.id)
      end
    end

    if officer.officer_role?
      can :read, Investigation
      can :new, Investigation
      can :create, Investigation
      can :update, Investigation do |this_investigation|
        current_investigations = officer.assignments.current.map(&:id)
        current_investigations.include?(this_investigation.id)
      end
      can :manage, InvestigationNote
      can :read, Assignment
      can :read, Crime
      can :manage, CrimeInvestigation
      can :read, Officer do |this_officer|  
        this_officer.id == officer.id
      end
      can :update, Officer do |this_officer|  
        this_officer.id == officer.id
      end
      can :index, Unit
      can :show, Unit do |this_unit|
        this_unit.id == officer.unit_id
      end
    end
  end
end
