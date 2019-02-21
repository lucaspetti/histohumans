require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "should not save person without name" do
    person = Person.new
    assert_not person.save, "Saved the person without a name"
  end

  test "full_name returns first name and last name" do
    person = Person.new(first_name: "John", last_name: "Lennon")
    assert_equal "John Lennon", person.full_name, "Full name did not return correctly"
  end

  test "sample returns a person instance" do
    sample = Person.sample
    assert_instance_of Person, sample, "Sample is not an instance of Person"
  end
end
