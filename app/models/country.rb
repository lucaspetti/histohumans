class Country < ApplicationRecord
  has_many :people
  has_many :maps

  validates :name, presence: true
end
