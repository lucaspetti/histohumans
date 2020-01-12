# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Continent, type: :model do
  let(:continent) { create(:continent) }

  it { is_expected.to have_many(:countries) }
  it { is_expected.to validate_presence_of(:name) }
end
