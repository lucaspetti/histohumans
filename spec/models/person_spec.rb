# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:country).of_type(:string) }
  it { is_expected.to have_db_column(:country_code).of_type(:string) }
  it { is_expected.to have_db_column(:occupation).of_type(:string) }
  it { is_expected.to have_db_column(:birthdate).of_type(:datetime) }
  it { is_expected.to have_db_column(:death).of_type(:datetime) }
end
