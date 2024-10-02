require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @unit = FactoryBot.create(:unit)
    @officer = FactoryBot.create(:officer, unit: @unit)
    @investigation = FactoryBot.create(:investigation)
  end

  test "should get new" do
    get new_assignment_path(officer_id: @officer.id)
    assert_response :success
    assert_not_nil assigns(:officer)
    assert_not_nil assigns(:officer_investigations)
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignments_path, params: { assignment: { officer_id: @officer.id, investigation_id: @investigation.id, start_date: Date.current, end_date: nil } }
    end
    assert_equal "Successfully added assignment.", flash[:notice]
    assert_redirected_to officer_path(Assignment.last.officer)

    post assignments_path, params: { assignment: { officer_id: @officer.id, investigation_id: nil, start_date: Date.current, end_date: nil } }
    assert_template :new, locals: { officer: @officer }
  end

  test "should terminate assignment" do
    @assignment = FactoryBot.create(:assignment, officer: @officer, investigation: @investigation)
    assert_equal 1, @officer.assignments.current.count
    patch terminate_assignment_path(@assignment)
    @officer.reload
    assert_equal 0, @officer.assignments.current.count
    assert_redirected_to officer_path(@assignment.officer)
    assert_equal "Successfully terminated assignment.", flash[:notice]
  end

  test "should not have generic routes (i.e., not using resources :assignments)" do
    @assignment = FactoryBot.create(:assignment, officer: @officer, investigation: @investigation)
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "assignments", action: "index") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "assignments", action: "show", id: "#{@assignment.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "assignments", action: "edit", id: "#{@assignment.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "assignments", action: "update", id: "#{@assignment.id}") end
    assert_raise ActionController::UrlGenerationError do get url_for(controller: "assignments", action: "destroy", id: "#{@assignment.id}") end
  end
end

