# frozen_string_literal: true

FactoryBot.define do
  factory :person, class: 'Person' do
    name { 'Some Person' }
    birthdate { Date.today }
  end
end
