class Quiz < ApplicationRecord
  belongs_to :country, optional: true
  validates :name, uniqueness: true
  has_many :questions, dependent: :destroy
end
