require 'faker'

module Contexts
  module Officers

    def create_officers
      @jblake   = FactoryBot.create(:officer, unit: @major_crimes)
      @jgordon  = FactoryBot.create(:officer, first_name: "Jim", last_name: "Gordon", rank: "Commissioner", username:"jgordon", role: "commish", unit: @headquarters, ssn: "064-23-0511")
      @msawyer  = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", role: "chief", username: "msawyer", unit: @major_crimes)
      @gloeb    = FactoryBot.create(:officer, first_name: "Gillian", last_name: "Loeb", rank: "Commissioner", username: "gloeb", role: "commish", unit: @headquarters, active: false)
      @jazeveda = FactoryBot.create(:officer, first_name: "Josh", last_name: "Azeveda", rank: "Detective", username: "jazeveda", role: "officer", unit: @major_crimes)
    end

    def create_more_officers
        # At HQ
        @sxue     = FactoryBot.create(:officer, first_name: "Stacey", last_name: "Xue", rank: "Officer", username: "sxue", role: "officer", unit: @headquarters)
        @nfields  = FactoryBot.create(:officer, first_name: "Nora", last_name: "Fields", rank: "Captain", username: "nfields", role: "chief", unit: @coroner)
        @makins   = FactoryBot.create(:officer, first_name: "Michael", last_name: "Akins", rank: "Captain", username: "makins", role: "chief", unit: @forensics)
        @mbarra   = FactoryBot.create(:officer, first_name: "Mac", last_name: "Barra", rank: "Officer", username: "mbarra", role: "officer", unit: @forensics)
        @fdiaz    = FactoryBot.create(:officer, first_name: "Flora", last_name: "Diaz", rank: "Officer", username: "fdiaz", role: "officer", unit: @forensics)

        # Major Crimes
        @dcornwell  = FactoryBot.create(:officer, first_name: "David", last_name: "Cornwell", rank: "Lieutenant", username: "dcornwell", role: "officer", unit: @major_crimes)
        @jbartlett = FactoryBot.create(:officer, first_name: "Jane", last_name: "Bartlett", rank: "Detective", username: "jbartlett", role: "officer", unit: @major_crimes)
        @hbullock = FactoryBot.create(:officer, first_name: "Harvey", last_name: "Bullock", rank: "Detective", username: "hbullock", role: "officer", unit: @major_crimes)
        @tburke = FactoryBot.create(:officer, first_name: "Thomas", last_name: "Burke", rank: "Detective", username: "tburke", role: "officer", unit: @major_crimes)
        @rchandler = FactoryBot.create(:officer, first_name: "Romy", last_name: "Chandler", rank: "Detective", username: "rchandler", role: "officer", unit: @major_crimes)
        @ecohen = FactoryBot.create(:officer, first_name: "Eric", last_name: "Cohen", rank: "Detective", username: "ecohen", role: "officer", unit: @major_crimes)
        @jdavies = FactoryBot.create(:officer, first_name: "Jackson", last_name: "Davies", rank: "Detective Sergeant", username: "jdavies", role: "officer", unit: @major_crimes)
        @ncrowe = FactoryBot.create(:officer, first_name: "Nelson", last_name: "Crowe", rank: "Detective", username: "ncrowe", role: "officer", unit: @major_crimes)
        @varrazzio = FactoryBot.create(:officer, first_name: "Vincent", last_name: "Arrazzio", rank: "Detective Sergeant", username: "varrazzio", role: "officer", unit: @major_crimes)
        @mc_officers = [@dcornwell,@jblake,@jazeveda,@jbartlett,@hbullock,@tburke,@rchandler,@ecohen,@jdavies,@ncrowe,@varrazzio]
        @mc_stars = [@jazeveda,@jbartlett,@ecohen,@varrazzio]
        # one officer guaranteed to have no assignments
        akasinsky = FactoryBot.create(:officer, first_name: "Andi", last_name: "Kasinsky", rank: "Detective", username: "akasinsky", role: "officer", unit: @major_crimes)


        # Homicide
        @calvarez  = FactoryBot.create(:officer, first_name: "Carlos", last_name: "Alvarez", rank: "Detective", username: "calvarez", role: "officer", unit: @homicide)
        @jbard  = FactoryBot.create(:officer, first_name: "Jason", last_name: "Bard", rank: "Detective", username: "jbard", role: "officer", unit: @homicide)
        @bbilbao  = FactoryBot.create(:officer, first_name: "Brian", last_name: "Bilbao", rank: "Lieutenant", username: "bbilbao", role: "officer", unit: @homicide)
        @ghennelly  = FactoryBot.create(:officer, first_name: "Gerrard", last_name: "Hennelly", rank: "Captain", username: "ghennelly", role: "chief", unit: @homicide)
        @dpeak  = FactoryBot.create(:officer, first_name: "Donald", last_name: "Peak", rank: "Officer", username: "dpeak", role: "officer", unit: @homicide)
        @rmulcahey  = FactoryBot.create(:officer, first_name: "Rebecca", last_name: "Mulcahey", rank: "Officer", username: "rmulcahey", role: "officer", unit: @homicide)
        @homicide_officers = [@calvarez,@jbard,@bbilbao,@dpeak,@rmulcahey]

        # Patrol
        @patrol_officers = Array.new
        cmason  = FactoryBot.create(:officer, first_name: "Catherine", last_name: "Mason", rank: "Captain", username: "cmason", role: "chief", unit: @patrol)
        50.times do
          patrol_officer = create_officer_from_unit(@patrol)
          @patrol_officers << patrol_officer
        end

        # Quick Response Team
        @jcolby  = FactoryBot.create(:officer, first_name: "James", last_name: "Colby", rank: "Captain", username: "jcolby", role: "chief", unit: @quick_response)
        12.times do
          create_officer_from_unit(@quick_response)
        end
    end

    def create_officer_from_unit(unit)
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      username = "#{first_name[0].downcase}#{last_name.downcase}#{rand(999)}"
      this_officer  = FactoryBot.create(:officer, first_name: first_name, last_name: last_name, rank: "Officer", username: username, role: "officer", unit: unit)
    end

  end
end