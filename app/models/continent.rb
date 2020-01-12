# frozen_string_literal: true

class Continent < ApplicationRecord
  has_many :countries
  has_many :people, through: :countries

  validates :name, presence: true

  def self.number_of_people
    all.each { |continent| puts "#{continent.name} - #{continent.people.size}" }
  end
end
