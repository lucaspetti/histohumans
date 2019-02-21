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
    assert_instance_of Person, Person.sample, "Sample is not an instance of Person"
  end

  test "ensures that there is a first name" do
    assert_not_nil Person.first.first_name, "First name is nil"
  end
end
