module OfficerAuthentication 

  # For role dropdown
  ROLES = [['Commissioner', 'commish'],['Unit Chief', 'chief'],['Officer', 'officer']].freeze
  
  # login by username
  def Officer.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end 

end