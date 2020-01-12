# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Getting people', type: :request do
  context 'when getting an existing person' do
    let!(:person) { create(:person) }

    it 'returns an object of the person' do
      get '/api/v1/people'

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)

      expect(json.size).to eq(1)
      expect(json.first['first_name']).to eq(person.first_name)
      expect(json.first['bio']).to eq(person.bio)
    end
  end
end
