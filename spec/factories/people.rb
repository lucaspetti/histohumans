# frozen_string_literal: true

FactoryBot.define do
  factory :person, class: 'Person' do
    first_name { 'Someone' }
    birthdate { Date.today }
    bio { 'Fake bio' }
    continent
  end
end
