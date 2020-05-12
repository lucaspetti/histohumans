# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:country) { create :country }
  let!(:person) do
    create :person, country_id: country.id, first_name: 'Napoleon', last_name: 'Bonaparte'
  end
  let!(:second_person) { create :person, country_id: country.id }

  it { is_expected.to belong_to(:country) }
  it { is_expected.to have_one(:continent) }

  # it { should have_many(:maps).through(:country) }
  it { is_expected.to have_many(:quizzes) }
  it { is_expected.to have_one(:page) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:birthdate) }
  it { is_expected.to validate_presence_of(:bio) }

  it { is_expected.to have_db_column(:last_name).of_type(:string) }
  it { is_expected.to have_db_column(:occupation).of_type(:string) }
  it { is_expected.to have_db_column(:birthdate).of_type(:date) }
  it { is_expected.to have_db_column(:death).of_type(:date) }
  it { is_expected.to have_db_column(:bio).of_type(:text) }

  describe 'Class methods' do
    describe '.sample' do
      it 'returns a random person' do
        expect(described_class.sample).to be_an_instance_of(described_class)
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
