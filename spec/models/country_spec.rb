# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:country) { create :country }

  it { is_expected.to belong_to(:continent) }
  it { is_expected.to have_many(:people) }
  it { is_expected.to have_many(:maps) }
  it { is_expected.to have_many(:quizzes) }
  it { is_expected.to have_one(:page) }

  it { is_expected.to validate_presence_of(:name) }

  describe 'Instance methods' do
    let(:brazil) { create :country, name: 'Brazil' }
    let!(:person) { create :person, country_id: brazil.id }

    describe '#people?' do
      it 'returns false if the country has no person' do
        expect(country).not_to be_people
      end

      it 'returns true if the country has a person' do
        expect(brazil).to be_people
      end
    end

    describe '#people_with_number' do
      let(:second_person) { build :person, country_id: brazil.id }

      it 'returns an array with the given number of associated people' do
        expect(brazil.people_with_number(1)).to eq([person])
        second_person.save!
        expect(brazil.reload.people_with_number(2)).to include(person, second_person)
      end
    end
  end
end
