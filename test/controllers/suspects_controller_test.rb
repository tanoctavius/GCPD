require "test_helper"

class SuspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @criminal      = FactoryBot.create(:criminal)
    @investigation = FactoryBot.create(:investigation)
  end

  test "should get new" do
    # assuming on the investigation#show page to start process
    get new_suspect_path(investigation_id: @investigation.id)
    assert_response :success
    assert_not_nil assigns(:suspect)
    assert_not_nil assigns(:investigation)
    assert_not_nil assigns(:current_suspects)
  end

  test "should create suspect" do
    assert_difference('Suspect.count') do
      post suspects_path, params: { suspect: { criminal_id: @criminal.id, investigation_id: @investigation.id, added_on: Date.current } }
    end
    assert_equal "Successfully added suspect.", flash[:notice]
    # came from and now return to investigation#show page
    assert_redirected_to investigation_path(Suspect.last.investigation)

    post suspects_path, params: { suspect: { criminal_id: nil, investigation_id: @investigation.id, added_on: Date.current } }
    assert_template :new
  end

  test "should terminate suspect" do  
    @suspect = FactoryBot.create(:suspect, criminal: @criminal, investigation: @investigation, added_on: Date.current)  
    patch terminate_suspect_path(@suspect)
    @suspect.reload
    assert_equal Date.current, @suspect.dropped_on
    assert_redirected_to investigation_path(@suspect.investigation)
  end



  test "should not have generic routes (i.e., not using resources :suspects)" do
    @suspect = FactoryBot.create(:suspect, criminal: @criminal, investigation: @investigation, added_on: Date.current)  
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "suspects", action: "index") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "suspects", action: "show", id: "#{@suspect.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "suspects", action: "edit", id: "#{@suspect.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "suspects", action: "update", id: "#{@suspect.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "suspects", action: "destroy", id: "#{@suspect.id}") end
  end
end