require 'rails_helper'

RSpec.describe Continent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  # before :each do
  #   @country = Country.new
  #   @continent = Continent.new(name: 'Europe')
  # end
end

describe "Associations" do
  it { is_expected.to have_many(:countries) }
end
