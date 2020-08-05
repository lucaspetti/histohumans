# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Getting people', type: :request, elasticsearch: true do
  let!(:person) { create :person, name: 'Nelson Freire' }
  let!(:person_2) { create :person, name: 'Nelson Mandela' }
  let(:json) { JSON.parse(response.body) }

  describe 'Index' do
    before { get '/api/v1/search', params: params }

    context 'when sending no params' do
      let(:params) { {} }

      it 'returns an empty array' do
        expect(response).to have_http_status(:ok)
        expect(json).to eq []
      end
    end

    context 'when providing a search query' do
      let(:params) { { q: 'Nelson' } }

      it 'returns an array with people that match the query' do
        expect(response).to have_http_status(:ok)
        expect(json).to eq({ results: ['Nelson Freire', 'Nelson Mandela'] })
      end
    end
  end
end
