class PeopleController < ApplicationController
  def index
    @people = Person.all
    @countries = Country.all
    @continents = Continent.all
  end

  def show
    @person = Person.find(params[:id])
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

  # def person_params
  #   params.require(:person).permit(:name, :photo)
  # end
end
