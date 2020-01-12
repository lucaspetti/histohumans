# frozen_string_literal: true

class QuizzesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end
end
