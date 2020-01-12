# frozen_string_literal: true

class Country < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :continent

  has_many :people
  has_many :maps
  has_many :quizzes
  has_one :page

  validates :name, presence: true

  def people?
    people.any?
  end

  def people_with_number(number)
    people.select { |person| people.index(person) < number }
  end

  def self.empty_count
    s = 0
    Country.all.each { |c| s += 1 if c.people? }
    "#{s} countries have characters. #{Country.count - s} are empty"
  end

  def self.print_empty
    empty = []
    Country.all.each { |c| empty << c.name unless c.people? }
    puts empty
  end
end
