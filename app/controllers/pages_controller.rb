class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @people = Person.all
    @person = Person.sample
  end
end
