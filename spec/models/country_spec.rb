require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:country) { create :country }

  it { should belong_to(:continent) }
  it { should have_many(:people) }
  it { should have_many(:maps) }
  it { should have_many(:quizzes) }
  it { should have_one(:page) }

  it { should validate_presence_of(:name) }

  describe 'Instance methods' do
    let(:brazil) { create :country, name: 'Brazil' }
    let!(:person) { create :person, country_id: brazil.id }

    describe '#people?' do
      it 'returns false if the country has no person' do
        expect(country.people?).to be_falsy
      end

      it 'returns true if the country has a person' do
        expect(brazil.people?).to be_truthy
      end
    end

    describe '#people_with_number' do
      let(:second_person) { build :person, country_id: brazil.id }

      it 'returns an array with the given number of associated people' do
        expect(brazil.people_with_number(1)).to eq([person])
      end

      it 'returns an array with the given number of associated people' do
        second_person.save!
        expect(brazil.people_with_number(2)).to include(person, second_person)
      end
    end
  end
end
