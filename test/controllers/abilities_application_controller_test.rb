require 'test_helper'

class AbilitiesApplicationControllerTest < ActionDispatch::IntegrationTest

  # A few tests to make sure abilities were properly applied at the controller
  # level and the exception is properly handled
  setup do
    create_units
    create_officers
    create_investigations
    create_assignments
    get logout_path
  end

  test "a chief can update officers who are in her unit" do
    login_officer(@msawyer)
    get edit_officer_path(@jblake)
    assert_response :success
  end

  test "a chief cannot update officers who are not in her unit" do
    login_officer(@msawyer)
    get edit_officer_path(@jgordon)
    assert_equal "You are not authorized to take this action.", flash[:error]
    assert_redirected_to home_path
  end

  test "an officer can read his own information" do
    login_officer(@jblake)
    get officer_path(@jblake)
    assert_response :success
  end

  test "an officer cannot see other officers" do
    login_officer(@jblake)
    get officer_path(@jgordon)
    assert_equal "You are not authorized to take this action.", flash[:error]
    assert_redirected_to home_path
  end

  test "an officer cannot update other officers" do
    login_officer(@jblake)
    get edit_officer_path(@jazeveda)
    assert_equal "You are not authorized to take this action.", flash[:error]
    assert_redirected_to home_path
  end

  test "an officer cannot create an assignment" do
    login_officer(@jblake)
    get new_assignment_path
    assert_equal "You are not authorized to take this action.", flash[:error]
    assert_redirected_to home_path
  end

  test "an officer cannot terminate an assignment" do
    login_officer(@jblake)
    patch terminate_assignment_path(@lacey_jblake)
    assert_equal "You are not authorized to take this action.", flash[:error]
    assert_redirected_to home_path
  end

end