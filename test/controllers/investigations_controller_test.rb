require "test_helper"

class InvestigationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:commish)
    @investigation = FactoryBot.create(:investigation)
  end

  test "should get index" do
    get investigations_path
    assert_response :success
    assert_not_nil assigns(:open_investigations)
    assert_not_nil assigns(:closed_investigations)
    assert_not_nil assigns(:closed_unsolved)
    assert_not_nil assigns(:with_batman)
    assert_not_nil assigns(:unassigned_cases)
  end

  test "should get new" do
    get new_investigation_path
    assert_response :success
  end

  test "should create investigation" do
    assert_difference('Investigation.count') do
      post investigations_path, params: { investigation: { title: 'A Puzzling Robbery', description: 'A robbery committed by the Riddler.', crime_location: 'Gotham Bank', date_opened: Date.current, date_closed: nil, solved: nil, batman_involved: nil } }
    end
    assert_equal "Successfully added 'A Puzzling Robbery' to GCPD.", flash[:notice]
    assert_redirected_to investigation_path(Investigation.last)
  end

  test "should not create an invalid investigation" do
    post investigations_path, params: { investigation: { title: nil, description: 'A robbery committed by the Riddler.', crime_location: 'Gotham Bank', date_opened: Date.current, date_closed: nil, solved: nil, batman_involved: nil } }
    assert_template :new
  end

  test "should show investigation" do
    get investigation_path(@investigation)
    assert_response :success
    assert_not_nil assigns(:current_assignments)
  end

  test "should get edit" do
    get edit_investigation_path(@investigation)
    assert_response :success
  end

  test "should update investigation" do
    patch investigation_path(@investigation), params: { investigation: { title: @investigation.title, description: @investigation.description, crime_location: @investigation.crime_location, date_opened: @investigation.date_opened, date_closed: Date.current, solved: true, batman_involved: true } }
    assert_redirected_to investigation_path(@investigation)

    patch investigation_path(@investigation), params: { investigation: { title: nil, description: @investigation.description, crime_location: @investigation.crime_location, date_opened: @investigation.date_opened, date_closed: Date.current, solved: true, batman_involved: true } }
    assert_template :edit
  end

  test "should not update an invalid investigation" do
    patch investigation_path(@investigation), params: { investigation: { title: nil, description: @investigation.description, crime_location: @investigation.crime_location, date_opened: @investigation.date_opened, date_closed: Date.current, solved: true, batman_involved: true } }
    assert_template :edit
  end

  test "should close an investigation" do
    assert_equal 1, Investigation.is_open.count
    patch close_investigation_path(@investigation)
    assert_equal "Investigation has been closed.", flash[:notice]
    @investigation.reload
    assert_equal 0, Investigation.is_open.count
    assert_redirected_to investigations_path
  end

end
