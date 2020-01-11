require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:country) { create :country }
  let!(:person) do
    create :person, country_id: country.id, first_name: 'Napoleon', last_name: 'Bonaparte'
  end
  let!(:second_person) { create :person, country_id: country.id }

  it { should belong_to(:country) }
  it { should have_one(:continent) }

  # it { should have_many(:maps).through(:country) }
  it { should have_many(:quizzes) }
  it { should have_one(:page) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:birthdate) }
  it { should validate_presence_of(:bio) }

  describe 'Class methods' do
    describe '.sample' do
      it 'should return a random person' do
        expect(described_class.sample).to be_an_instance_of(Person)
      end
    end
  end

  describe 'Instance methods' do
    describe '#full_name' do
      it 'returns the person full name' do
        expect(person.full_name).to eq('Napoleon Bonaparte')
      end
    end

    describe '#compatriots' do
      it 'returns the person compatriots' do
        expect(person.compatriots).to eq([second_person])
      end
    end
  end
end
