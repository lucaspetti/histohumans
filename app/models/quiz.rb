class Quiz < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :person, optional: true

  has_many :questions, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :level, inclusion: { in: ['basic', 'intermediate', 'advanced'],
                                 message: "%{value} is not a valid level" },
                    presence: true
end
