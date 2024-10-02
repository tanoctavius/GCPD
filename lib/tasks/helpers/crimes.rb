module Populator
  module Crimes
    def create_crimes
      murder1  = FactoryBot.create(:crime, name: "Murder, First Degree")
      murder2  = FactoryBot.create(:crime, name: "Murder, Second Degree")
      manslt   = FactoryBot.create(:crime, name: "Manslaughter")
      manslt2  = FactoryBot.create(:crime, name: "Manslaughter, Second Degree", active: false)
      arson    = FactoryBot.create(:crime, name: "Arson")
      robbery  = FactoryBot.create(:crime, name: "Armed Robbery")
      assault  = FactoryBot.create(:crime, name: "Assault")
      battery  = FactoryBot.create(:crime, name: "Battery")
      kidnap   = FactoryBot.create(:crime, name: "Kidnapping")
      traf     = FactoryBot.create(:crime, name: "Drug Trafficking")
      possess  = FactoryBot.create(:crime, name: "Drug Possession")
      trespass = FactoryBot.create(:crime, name: "Trespass", felony: false)
      ptheft   = FactoryBot.create(:crime, name: "Petty Theft", felony: false)
      d_peace  = FactoryBot.create(:crime, name: "Disturbing the Peace", felony: false)
      vandal   = FactoryBot.create(:crime, name: "Vandalism", felony: false)
    end
  end
end