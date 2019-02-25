require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @quiz = quizzes(:basicworldquiz)
  # end

  # teardown do
  #   Rails.cache.clear
  # end

  # test "should get index" do
  #   get quizzes_url
  #   assert_equal "index", @controller.action_name
  #   assert_match "Quizzes", @response.body
  #   assert_response :success
  # end

  # test "should show quiz" do
  #   get quiz_url(@quiz)
  #   assert_response :success
  # end

  # test "should destroy quiz" do
  #   assert_difference('Quiz.count', -1) do
  #     delete quiz_url(@quiz)
  #   end

  #   assert_redirected_to quizzess_path
  # end

  # test "should update quiz" do
  #   patch quiz_url(@quiz), params: { quiz: { title: "updated" } }

  #   assert_redirected_to quiz_path(@quiz)
  #   # Reload association to fetch updated data and assert that title is updated.
  #   @quiz.reload
  #   assert_equal "updated", @quiz.title
  # end
end
