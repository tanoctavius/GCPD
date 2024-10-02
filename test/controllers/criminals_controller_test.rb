require "test_helper"

class CriminalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @criminal = FactoryBot.create(:criminal)
  end

  test "should get index" do
    get criminals_path
    assert_response :success
    assert_not_nil assigns(:criminals)
    assert_not_nil assigns(:enhanced_powers)
  end

  test "should get new" do
    get new_criminal_path
    assert_response :success
  end

  test "should create criminal" do
    assert_difference('Criminal.count') do
      post criminals_path, params: { criminal: { first_name: "Talia", last_name: "al Ghul", aka: nil, convicted_felon: false, enhanced_powers: false} }
    end
    assert_equal "Successfully added Talia al Ghul to GCPD.", flash[:notice]
    assert_redirected_to criminal_path(Criminal.last)
  end

  test "should not create invalid criminal" do
    post criminals_path, params: { criminal: { first_name: "Talia", last_name: nil, aka: nil, convicted_felon: false, enhanced_powers: false} }
    assert_template :new
  end

  test "should show criminal" do
    get criminal_path(@criminal)
    assert_response :success
    assert_not_nil assigns(:suspects)
  end

  test "should get edit" do
    get edit_criminal_path(@criminal)
    assert_response :success
  end

  test "should update criminal" do
    catwoman = FactoryBot.create(:criminal, first_name: "Selina", last_name: "Kyle", aka: "Catwoman", convicted_felon: true)
    patch criminal_path(catwoman), params: { criminal: { first_name: "Selina", last_name: "Kyle", aka: "Catwoman", convicted_felon: false, enhanced_powers: false} }
    assert_redirected_to criminal_path(catwoman)
  end

  test "should not update an invalid criminal" do
    catwoman = FactoryBot.create(:criminal, first_name: "Selina", last_name: "Kyle", aka: "Catwoman", convicted_felon: true)
    patch criminal_path(catwoman), params: { criminal: { first_name: nil, last_name: "Kyle", aka: "Catwoman", convicted_felon: false, enhanced_powers: false} }
    assert_template :edit
  end

  test "should destroy criminal when appropriate" do
    post criminals_path, params: { criminal: { first_name: "Talia", last_name: "al Ghul", aka: nil, convicted_felon: false, enhanced_powers: false} }
    assert_difference('Criminal.count', -1) do
      delete criminal_path(Criminal.last)
    end
    assert_equal "Removed Talia al Ghul from the system.", flash[:notice]
    assert_redirected_to criminals_path
  end

end