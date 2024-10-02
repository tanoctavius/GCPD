require "test_helper"

class OfficersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @unit = FactoryBot.create(:unit)
    @officer = FactoryBot.create(:officer, unit: @unit)
  end

  test "should get index" do
    get officers_path
    assert_response :success
    assert_not_nil assigns(:active_officers)
    assert_not_nil assigns(:inactive_officers)
  end

  test "should get new" do
    get new_officer_path
    assert_response :success
  end

  test "should create officer" do
    assert_difference('Officer.count') do
      post officers_path, params: { officer: { active: true, ssn: "032-03-5600", rank: "Detective", first_name: "Eric", last_name: "Blake", unit_id: @unit.id, username: "loki", role: "officer", password: "loki", password_confirmation: "loki"} }
    end
    assert_equal "Successfully created Eric Blake.", flash[:notice]
    assert_redirected_to officer_path(Officer.last)
  end

  test "should not create invalid officer" do
    post officers_path, params: { officer: { active: true, ssn: @officer.ssn, rank: "Detective", first_name: nil, last_name: "Blake", unit_id: @unit.id, username: "loki", role: "officer" } }
    assert_template :new
  end

  test "should show officer" do
    get officer_path(@officer)
    assert_response :success
    assert_not_nil assigns(:current_assignments)
    assert_not_nil assigns(:past_assignments)
  end

  test "should get edit" do
    get edit_officer_path(@officer)
    assert_response :success
  end

  test "should update officer" do
    patch officer_path(@officer), params: { officer: { active: @officer.active, ssn: @officer.ssn, rank: @officer.rank, first_name: "Alexander", last_name: @officer.last_name, unit_id: @officer.unit_id } }
    assert_redirected_to officer_path(@officer)
  end

  test "should not update an invalid officer" do
    patch officer_path(@officer), params: { officer: { active: @officer.active, ssn: @officer.ssn, rank: @officer.rank, first_name: nil, last_name: @officer.last_name, unit_id: @officer.unit_id } }
    assert_template :edit
  end

  test "should destroy officer when appropriate" do
    assert_difference('Officer.count', -1) do
      delete officer_path(@officer)
    end
    assert_equal "Removed #{@officer.proper_name} from the system.", flash[:notice]
    assert_redirected_to officers_path
  end

  test "should not destroy officer when inappropriate" do
    @investigation = FactoryBot.create(:investigation)
    @assignment = FactoryBot.create(:assignment, officer: @officer, investigation: @investigation, start_date: Date.current, end_date: nil)
    assert_difference('Officer.count', 0) do
      delete officer_path(@officer)
    end
    assert_template :show
  end
end
