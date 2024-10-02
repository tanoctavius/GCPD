require "test_helper"

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @unit = FactoryBot.create(:unit)
  end

  test "should get index" do
    get units_path
    assert_response :success
    assert_not_nil assigns(:active_units)
    assert_not_nil assigns(:inactive_units)
  end

  test "should get new" do
    get new_unit_path
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post units_path, params: { unit: { active: true, name: 'OCCD' } }
    end
    assert_equal "Successfully added OCCD to GCPD.", flash[:notice]
    assert_redirected_to units_path

    post units_path, params: { unit: { active: true, name: nil } }
    assert_template :new
  end

  test "should show unit" do
    get unit_path(@unit)
    assert_response :success
    assert_not_nil assigns(:officers)
  end

  test "should get edit" do
    get edit_unit_path(@unit)
    assert_response :success
  end

  test "should update unit" do
    patch unit_path(@unit), params: { unit: { active: false, name: @unit.name } }
    assert_redirected_to unit_path(@unit)

    patch unit_path(@unit), params: { unit: { active: false, name: nil } }
    assert_template :edit
  end

  test "should destroy unit when appropriate" do
    assert_difference('Unit.count', -1) do
      delete unit_path(@unit)
    end
    assert_equal "Removed #{@unit.name} from the system.", flash[:notice]
    assert_redirected_to units_path
  end

  test "should not destroy unit when inappropriate" do
    @officer = FactoryBot.create(:officer, unit: @unit)
    assert_difference('Unit.count', 0) do
      delete unit_path(@unit)
    end
    assert_template 'index'
  end
end

