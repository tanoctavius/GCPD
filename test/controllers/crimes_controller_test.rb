require "test_helper"

class CrimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @crime = FactoryBot.create(:crime)
  end

  test "should get index" do
    get crimes_path
    assert_response :success
    assert_not_nil assigns(:active_crimes)
    assert_not_nil assigns(:inactive_crimes)
  end

  test "should get new" do
    get new_crime_path
    assert_response :success
  end

  test "should create crime" do
    assert_difference('Crime.count') do
      post crimes_path, params: { crime: { active: true, name: 'Bribery' } }
    end
    assert_equal "Successfully added Bribery to GCPD.", flash[:notice]
    assert_redirected_to crimes_path

    post crimes_path, params: { crime: { active: true, name: nil } }
    assert_template :new
  end

  test "should get edit" do
    get edit_crime_path(@crime)
    assert_response :success
  end

  test "should update crime" do
    patch crime_path(@crime), params: { crime: { active: false, name: @crime.name } }
    assert_redirected_to crimes_path

    patch crime_path(@crime), params: { crime: { active: false, name: nil } }
    assert_template :edit
  end
end


