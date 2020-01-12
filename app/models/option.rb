# frozen_string_literal: true

class Option < ApplicationRecord
  belongs_to :question
  validates :text, presence: true
  validates :correct, inclusion: { in: [true, false] }
end
