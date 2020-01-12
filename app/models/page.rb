# frozen_string_literal: true

class Page < ApplicationRecord
  has_one :country
  has_one :person

  validates :url, presence: true
end
