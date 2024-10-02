module Contexts
  module Units

    def create_units
      @major_crimes = FactoryBot.create(:unit)
      @headquarters = FactoryBot.create(:unit, name: "Headquarters")
      @homicide     = FactoryBot.create(:unit, name: "Homicide")
      @section_31   = FactoryBot.create(:unit, name: "Section 31", active: false)
    end

    def create_more_units
      @forensics      = FactoryBot.create(:unit, name: "Forensics")
      @coroner        = FactoryBot.create(:unit, name: "Coroner")
      @narcotics      = FactoryBot.create(:unit, name: "Narcotics")
      @patrol         = FactoryBot.create(:unit, name: "Patrol")
      @swat           = FactoryBot.create(:unit, name: "S.W.A.T.", active: false)  # became quick response team...
      @quick_response = FactoryBot.create(:unit, name: "Quick Response Team")
    end

  end
end