class Country < ApplicationRecord
  has_many :people
  has_many :maps
end
