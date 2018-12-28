class Person < ApplicationRecord
  belongs_to :country
  has_many :maps, through: :countries

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :bio, presence: true
end
