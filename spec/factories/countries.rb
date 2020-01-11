# frozen_string_literal: true

FactoryBot.define do
  factory :country, class: 'Country' do
    name { 'Someland' }
    continent
  end
end
