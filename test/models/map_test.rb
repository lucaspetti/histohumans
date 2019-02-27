require 'test_helper'

class MapTest < ActiveSupport::TestCase
  # setup do
  #   @map = maps(:unitedkingdom)
  # end

  teardown do
    Rails.cache.clear
  end

  test "should belong to a country" do
    map = Map.new(country: countries(:albania))
    assert_instance_of Country, map.country, "map does not belong to a country"
  end
end
