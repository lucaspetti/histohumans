require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:lincoln)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get people_url
    assert_equal "index", @controller.action_name
    # assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "People", @response.body
    assert_response :success
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end
end
