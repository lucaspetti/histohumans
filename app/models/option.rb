class Option < ApplicationRecord
  belongs_to :question
  validates :text, presence: true
  validates :correct, presence: true
end
