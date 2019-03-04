require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  setup do
    @country = countries(:france)
  end

  teardown do
    Rails.cache.clear
  end

  test "should not save country without a name" do
    country = Country.new(continent: continents(:asia))
    assert_not country.save, "Saved the country without a name"
  end

  test "should not save country without a continent" do
    country = Country.new(name: 'Laos')
    assert_not country.save, "Saved the country without a continent"
  end

  test "country should have many people" do
    assert_not_nil @country.people, "people method returns nil"
    assert_instance_of Person, @country.people.first, "people method does not return a collection with instances of person"
  end

  test "should belong to a continent" do
    assert_not_nil @country.continent, "continent method returns nil"
    assert_instance_of Continent, @country.continent, "continent method returns a valid continent"
  end

  # test "should have a Wikipedia page" do
  #   assert_instance_of Page, @country.page, "country has no Wikipedia page"
  # end

  test "empty_count should return a string" do
    assert_instance_of String, Country.empty_count, "empty_count does not return a string"
  end

  test "people_with_number returns an array" do
    assert_instance_of Array, @country.people_with_number(1), "people_with_number does not return an array"
  end
end
