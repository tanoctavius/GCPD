require 'test_helper'

class Handling404ApplicationControllerTest < ActionDispatch::IntegrationTest

  # A test to make sure the application controller is handling 
  # 404 errors in a reasonable manner.
  setup do
    @major_crimes = FactoryBot.create(:unit)
    @msawyer  = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", role: "chief", username: "msawyer", unit: @major_crimes)
  end

  test "a 404 error is adequately handled by the system." do
    login_officer(@msawyer)
    get officer_path(999)
    assert_equal "We apologize, but this information could not be found.", flash[:error]
    assert_redirected_to home_path
  end

end