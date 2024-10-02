require "test_helper"

class InvestigationNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @unit = FactoryBot.create(:unit)
    @officer = FactoryBot.create(:officer, unit: @unit)
    @investigation = FactoryBot.create(:investigation)
    @assignment = FactoryBot.create(:assignment, officer: @officer, investigation: @investigation)
  end

  test "should get new" do
    get new_investigation_note_path(investigation_id: @investigation.id)
    assert_response :success
    assert_not_nil assigns(:investigation_note)
    assert_not_nil assigns(:investigation)
  end

  test "should create investigation_note" do
    assert_difference('InvestigationNote.count') do
      post investigation_notes_path, params: { investigation_note: { officer_id: @officer.id, investigation_id: @investigation.id, content: 'Batman solved the crime.' } }
    end
    assert_equal "Successfully added investigation note.", flash[:notice]
    assert_redirected_to investigation_path(InvestigationNote.last.investigation)

    post investigation_notes_path, params: { investigation_note: { officer_id: @officer.id, investigation_id: @investigation.id, content: nil } }
    assert_template :new, locals: { investigation: @investigation }
  end

  test "should not have generic routes (i.e., not using resources :investigation_notes)" do
    @investigation_note = FactoryBot.create(:investigation_note, officer: @officer, investigation: @investigation)
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "investigation_notes", action: "index") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "investigation_notes", action: "show", id: "#{@investigation_note.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "investigation_notes", action: "edit", id: "#{@investigation_note.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "investigation_notes", action: "update", id: "#{@investigation_note.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "investigation_notes", action: "destroy", id: "#{@investigation_note.id}") end
  end
end