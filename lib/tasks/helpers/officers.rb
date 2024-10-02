module Populator
  module Officers
    require 'faker'

    def create_officers
    # At HQ
    jgordon  = FactoryBot.create(:officer, username: "jgordon", role: "commish", first_name: "Jim", last_name: "Gordon", rank: "Commissioner", unit: headquarters, ssn: "064-23-0511")
    gloeb    = FactoryBot.create(:officer, username: "gloeb", role: "commish", first_name: "Gillian", last_name: "Loeb", rank: "Commissioner", unit: headquarters, active: false)
    sxue     = FactoryBot.create(:officer, username: "sxue", role: "officer", first_name: "Stacey", last_name: "Xue", rank: "Officer", unit: headquarters)
    nfields     = FactoryBot.create(:officer, username: "nfields", role: "chief", first_name: "Nora", last_name: "Fields", rank: "Captain", unit: coroner)
    makins     = FactoryBot.create(:officer, username: "makins", role: "chief", first_name: "Michael", last_name: "Akins", rank: "Captain", unit: forensics)
    mbarra     = FactoryBot.create(:officer, username: "mbarra", role: "officer", first_name: "Mac", last_name: "Barra", rank: "Officer", unit: forensics)
    fdiaz     = FactoryBot.create(:officer, username: "fdiaz", role: "officer", first_name: "Flora", last_name: "Diaz", rank: "Officer", unit: forensics)
    puts "Created HQ & related officers"

    # # Major Crimes
    # msawyer_user = FactoryBot.create(:user, username: "msawyer", role: "chief")
    # msawyer  = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", user: msawyer_user, unit: major_crimes)
    # sessen_user = FactoryBot.create(:user, username: "sessen", role: "chief")
    # sessen  = FactoryBot.create(:officer, first_name: "Sarah", last_name: "Essen", rank: "Captain", user: sessen_user, unit: major_crimes, active: false)
    # dcornwell_user = FactoryBot.create(:user, username: "dcornwell", role: "officer")
    # dcornwell  = FactoryBot.create(:officer, first_name: "David", last_name: "Cornwell", rank: "Lieutenant", user: dcornwell_user, unit: major_crimes)
    # jblake_user  = FactoryBot.create(:user, username: "jblake", role: "officer")
    # jblake   = FactoryBot.create(:officer, user: jblake_user, unit: major_crimes)
    # jazeveda_user = FactoryBot.create(:user, username: "jazeveda", role: "officer")    
    # jazeveda = FactoryBot.create(:officer, first_name: "Josh", last_name: "Azeveda", rank: "Detective", user: jazeveda_user, unit: major_crimes)
    # jbartlett_user = FactoryBot.create(:user, username: "jbartlett", role: "officer")    
    # jbartlett = FactoryBot.create(:officer, first_name: "Jane", last_name: "Bartlett", rank: "Detective", user: jbartlett_user, unit: major_crimes)
    # hbullock_user = FactoryBot.create(:user, username: "hbullock", role: "officer")    
    # hbullock = FactoryBot.create(:officer, first_name: "Harvey", last_name: "Bullock", rank: "Detective", user: hbullock_user, unit: major_crimes)
    # tburke_user = FactoryBot.create(:user, username: "tburke", role: "officer")    
    # tburke = FactoryBot.create(:officer, first_name: "Thomas", last_name: "Burke", rank: "Detective", user: tburke_user, unit: major_crimes)
    # rchandler_user = FactoryBot.create(:user, username: "rchandler", role: "officer")    
    # rchandler = FactoryBot.create(:officer, first_name: "Romy", last_name: "Chandler", rank: "Detective", user: rchandler_user, unit: major_crimes)
    # ecohen_user = FactoryBot.create(:user, username: "ecohen", role: "officer")    
    # ecohen = FactoryBot.create(:officer, first_name: "Eric", last_name: "Cohen", rank: "Detective", user: ecohen_user, unit: major_crimes)
    # jdavies_user = FactoryBot.create(:user, username: "jdavies", role: "officer")    
    # jdavies = FactoryBot.create(:officer, first_name: "Jackson", last_name: "Davies", rank: "Detective Sergeant", user: jdavies_user, unit: major_crimes)
    # ncrowe_user = FactoryBot.create(:user, username: "ncrowe", role: "officer")    
    # ncrowe = FactoryBot.create(:officer, first_name: "Nelson", last_name: "Crowe", rank: "Detective", user: ncrowe_user, unit: major_crimes)
    # varrazzio_user = FactoryBot.create(:user, username: "varrazzio", role: "officer")    
    # varrazzio = FactoryBot.create(:officer, first_name: "Vincent", last_name: "Arrazzio", rank: "Detective Sergeant", user: varrazzio_user, unit: major_crimes)
    # mc_officers = [dcornwell,jblake,jazeveda,jbartlett,hbullock,tburke,rchandler,ecohen,jdavies,ncrowe,varrazzio]
    # mc_stars = [jblake,jazeveda,jbartlett,ecohen,varrazzio]

    # puts "Created Major Crimes officers"

    # # Homicide
    # calvarez_user = FactoryBot.create(:user, username: "calvarez", role: "officer")
    # calvarez  = FactoryBot.create(:officer, first_name: "Carlos", last_name: "Alvarez", rank: "Detective", user: calvarez_user, unit: homicide)
    # jbard_user = FactoryBot.create(:user, username: "jbard", role: "officer")
    # jbard  = FactoryBot.create(:officer, first_name: "Jason", last_name: "Bard", rank: "Detective", user: jbard_user, unit: homicide)
    # bbilbao_user = FactoryBot.create(:user, username: "bbilbao", role: "officer")
    # bbilbao  = FactoryBot.create(:officer, first_name: "Brian", last_name: "Bilbao", rank: "Lieutenant", user: bbilbao_user, unit: homicide)
    # ghennelly_user = FactoryBot.create(:user, username: "ghennelly", role: "chief")
    # ghennelly  = FactoryBot.create(:officer, first_name: "Gerrard", last_name: "Hennelly", rank: "Captain", user: ghennelly_user, unit: homicide)
    # dpeak_user = FactoryBot.create(:user, username: "dpeak", role: "officer")
    # dpeak  = FactoryBot.create(:officer, first_name: "Donald", last_name: "Peak", rank: "Officer", user: dpeak_user, unit: homicide)
    # rmulcahey_user = FactoryBot.create(:user, username: "rmulcahey", role: "officer")
    # rmulcahey  = FactoryBot.create(:officer, first_name: "Rebecca", last_name: "Mulcahey", rank: "Officer", user: rmulcahey_user, unit: homicide)
    # homicide_officers = [calvarez,jbard,bbilbao,dpeak,rmulcahey]
    # puts "Created Homicide officers"

    # # Patrol
    # patrol_officers = Array.new
    # cmason_user = FactoryBot.create(:user, username: "cmason", role: "chief")
    # cmason  = FactoryBot.create(:officer, first_name: "Catherine", last_name: "Mason", rank: "Captain", user: cmason_user, unit: patrol)
    # 50.times do
    #   patrol_officer = create_officer_and_user(patrol)
    #   patrol_officers << patrol_officer
    # end
    # puts "Created Patrol officers"

    # # Narcotics
    # narcotics_officers = Array.new
    # ddelaware_user = FactoryBot.create(:user, username: "ddelaware", role: "chief")
    # ddelaware  = FactoryBot.create(:officer, first_name: "Derek", last_name: "Mason", rank: "Captain", user: ddelaware_user, unit: narcotics)
    # 12.times do
    #   narc_officer = create_officer_and_user(narcotics)
    #   narcotics_officers << narc_officer
    # end
    # puts "Created Narcotics officers"

    # # Quick Response Team
    # jcolby_user = FactoryBot.create(:user, username: "jcolby", role: "chief")
    # jcolby  = FactoryBot.create(:officer, first_name: "James", last_name: "Colby", rank: "Captain", user: jcolby_user, unit: quick_response)
    # 24.times do
    #   create_officer_and_user(quick_response)
    # end
    end
  end
end