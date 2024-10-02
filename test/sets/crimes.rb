module Contexts
  module Crimes

    def create_crimes
      @murder   = FactoryBot.create(:crime)
      @murder2  = FactoryBot.create(:crime, name: "Murder, Second Degree", active: false)
      @arson    = FactoryBot.create(:crime, name: "Arson")
      @robbery  = FactoryBot.create(:crime, name: "Robbery")
      @trespass = FactoryBot.create(:crime, name: "Trespass", felony: false)
    end

  end
end