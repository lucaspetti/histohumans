class PagesController < ApplicationController
  def home
    @people = Person.all
    @person = Person.sample
  end
end
