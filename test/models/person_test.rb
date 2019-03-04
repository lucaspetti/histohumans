require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = people(:napoleon)
  end

  teardown do
    Rails.cache.clear
  end

  test "should not save person without name" do
    person = Person.new
    assert_not person.save, "Saved the person without a name"
  end

  test "should belong to a country" do
    assert_instance_of Country, @person.country, "person does not belong to a country"
  end

  test "full_name returns first name and last name" do
    assert_equal "Napoleon Bonaparte", @person.full_name, "Full name did not return correctly"
  end

  test "sample returns a person instance" do
    assert_instance_of Person, Person.sample, "Sample is not an instance of Person"
  end

  test "compatriots should return an array with other people from the same country" do
    assert_instance_of Array, @person.compatriots, "compatriots does not return an array"
    # test if other elements of the array are from the same country
    # assert if @person was removed from the array
  end

  test "ensures that there is a bio" do
    assert_not_nil Person.first.bio, "bio is nil"
  end

  # test "should have a Wikipedia page" do
  #   assert_instance_of Page, @person.page, "person has no Wikipedia page"
  # end
end
