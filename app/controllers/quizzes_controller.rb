class QuizzesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @quizzes = Quiz.all
  end
end
