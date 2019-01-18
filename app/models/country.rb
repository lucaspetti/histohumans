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
end
