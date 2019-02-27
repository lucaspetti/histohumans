require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  setup do
    @quiz = quizzes(:basicworldquiz)
  end

  teardown do
    Rails.cache.clear
  end

  test "should not save quiz without name" do
    quiz = Quiz.new(level: 'basic')
    assert_not quiz.save, "Saved the quiz without a name"
  end

  test "should not save quiz without level" do
    quiz = Quiz.new(name: 'First quiz')
    assert_not quiz.save, "Saved the quiz without level"
  end

  test "quiz level should be either Basic, Intermediate or Advanced" do
    quiz = Quiz.new(level: 'anything')
    assert_not quiz.save, "quiz level accepted anything"
  end

  test "quiz can belong to a country" do
    quiz = Quiz.new(country: countries(:france))
    assert_instance_of Country, quiz.country, "quiz.country does not return a instance of country"
  end

  test "quiz can belong to a person" do
    quiz = Quiz.new(person: people(:lincoln))
    assert_instance_of Person, quiz.person, "quiz.person does not return a instance of person"
  end
end
