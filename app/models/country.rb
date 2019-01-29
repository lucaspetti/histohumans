class Country < ApplicationRecord
  has_many :people
  has_many :maps
  belongs_to :continent

  validates :name, presence: true

  def people?
    true if Person.find_by(country: self)
  end

  def histohumans
    Person.where(country: self)
  end

  def self.empty_count
    s = 0
    Country.all.each { |c| s += 1 if c.people? }
    "#{s} countries have characters. #{Country.count - s} are empty"
  end
end
