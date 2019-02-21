require "application_system_test_case"

class ContinentsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/people"
    assert_selector "h2", text: "Search within the map or by Continent:"

    # assert_selector "a.continent-link", text: "North America"
  end
end
