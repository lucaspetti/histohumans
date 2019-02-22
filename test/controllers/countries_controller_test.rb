require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country = countries(:albania)
  end

  teardown do
    Rails.cache.clear
  end

  test "should show country" do
    get country_url(@country)
    assert_response :success
  end
end
