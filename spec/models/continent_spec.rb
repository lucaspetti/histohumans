require 'rails_helper'

RSpec.describe Continent, type: :model do
  let(:continent) { create(:continent) }

  it { should have_many(:countries) }
  it { should validate_presence_of(:name) }
end
