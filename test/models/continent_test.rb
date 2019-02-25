require 'test_helper'

class ContinentTest < ActiveSupport::TestCase
  test "should not save continent without name" do
    continent = Continent.new
    assert_not continent.save, "Saved the continent without a name"
  end

  test "continent should have many countries" do
    continent = Continent.first
    assert_not_nil continent.countries, "countries method returns nil"
  end
end
