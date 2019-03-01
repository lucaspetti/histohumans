class Continent < ApplicationRecord
  has_many :countries
  has_many :people, through: :countries

  validates :name, presence: true
end
