require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test "should not save country without name" do
    country = Country.new
    assert_not country.save, "Saved the country without a name"
  end

  test "country should have many people" do
    country = Country.first
    assert_not_nil country.people, "people method returns nil"
    assert_instance_of Person, country.people.first, "people method returns an array with instances of person"
  end

  test "should belong to a continent" do
    country = Country.first
    assert_not_nil country.continent, "continent method returns nil"
    assert_instance_of Continent, country.continent, "continent method returns a valid continent"
  end

  test "empty_count should return a string" do
    assert_instance_of String, Country.empty_count, "empty_count does not return a string"
  end

  test "people_with_number returns an array" do
    country = Country.first
    assert_instance_of Array, country.people_with_number(1), "people_with_number does not return an array"
  end
end
