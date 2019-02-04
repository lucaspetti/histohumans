class Quiz < ApplicationRecord
  belongs_to :country, optional: true
  validates :done, presence: true, inclusion: { in: [true, false] }
  has_many :questions
end
