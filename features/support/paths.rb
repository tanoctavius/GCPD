module NavigationHelpers
  def path_to(page_name)
    case page_name
 
    when /the home\s?page/
      '/'
    when /the About Us\s?page/
      about_path
    when /the Contact Us\s?page/
      contact_path
    when /the Privacy\s?page/
      privacy_path
    when /the Login\s?page/
      login_path
    when /the Logout\s?page/
      logout_path

    # INVESTIGATIONS
    when /the investigations\s?page/
      investigations_path      
    when /the new investigation\s?page/
      new_investigation_path
    when /the details on the Lacey Towers Murder/
      investigation_path(@lacey)
    when /edit the Lacey Towers Murder investigation\s?/
      edit_investigation_path(@lacey)  

    # OFFICERS
    when /the officers\s?page/ 
      officers_path
    when /John Blake's details\s?/
      officer_path(@jblake)
    when /Jim Gordon's details\s?/
      officer_path(@jgordon)
    when /edit John Blake's\s?record/
      edit_officer_path(@jblake)    
    when /the new officer\s?page/
      new_officer_path

    # UNITS
    when /the units\s?page/ 
      units_path
    when /the Major Crimes details\s?page/
      unit_path(@major_crimes)
    when /edit the Major Crimes\s?page/
      edit_unit_path(@major_crimes)    
    when /the new unit\s?page/
      new_unit_path

    # ASSIGNMENTS
    when /terminate Josh Azeveda's assignment\s?/
      terminate_assignment_path(@harbor_jazeveda)    
    when /add an assignment for Maggie Sawyer\s?/
      new_assignment_path(officer_id: @msawyer.id)

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)