class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  # private

end
