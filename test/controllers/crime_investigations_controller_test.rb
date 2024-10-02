require "test_helper"

class CrimeInvestigationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @crime = FactoryBot.create(:crime)
    @investigation = FactoryBot.create(:investigation)
  end

  test "should get new" do
    get new_crime_investigation_path(investigation_id: @investigation.id)
    assert_response :success
    assert_not_nil assigns(:crime_investigation)
    assert_not_nil assigns(:investigation)
    assert_not_nil assigns(:crimes_list)
  end

  test "should create crime_investigation" do
    assert_difference('CrimeInvestigation.count') do
      post crime_investigations_path, params: { crime_investigation: { crime_id: @crime.id, investigation_id: @investigation.id } }
    end
    crime_investigation = CrimeInvestigation.last
    assert_equal "Successfully added #{crime_investigation.crime.name} to #{crime_investigation.investigation.title}.", flash[:notice]
    assert_redirected_to investigation_path(CrimeInvestigation.last.investigation)

    post crime_investigations_path, params: { crime_investigation: { crime_id: nil, investigation_id: @investigation.id } }

    assert_template :new, locals: { investigation: @investigation, crimes_list: @crimes_list }

  end

  test "should destroy crime_investigation" do
    crime_investigation = FactoryBot.create(:crime_investigation, crime: @crime, investigation: @investigation)
    @investigation.reload
    assert_equal 1, @investigation.crime_investigations.count
    delete remove_crimes_path(crime_investigation)
    @investigation.reload
    assert_equal 0, @investigation.crime_investigations.count
    assert_redirected_to investigation_path(@investigation)
    assert_equal "Successfully removed a crime from this investigation.", flash[:notice]
  end

  test "should not have generic routes (from resources :crime_investigations)" do
    crime_investigation = FactoryBot.create(:crime_investigation, crime: @crime, investigation: @investigation)
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "crime_investigations", action: "show", id: "#{crime_investigation.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "crime_investigations", action: "edit", id: "#{crime_investigation.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "crime_investigations", action: "update", id: "#{crime_investigation.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "crime_investigations", action: "index") end
  end
end