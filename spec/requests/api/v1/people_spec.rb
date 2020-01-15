# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Getting people', type: :request do
  let!(:person) { create :person }
  let!(:person_2) { create :person, first_name: 'Abraham' }
  let(:json) { JSON.parse(response.body) }

  describe 'Index' do
    before { get '/api/v1/people', params: params }

    context 'when sending no params' do
      let(:params) { {} }

      it 'returns an array with all objects of people' do
        expect(response).to have_http_status(:ok)
        expect(json.size).to eq(2)
        expect(json.first['first_name']).to eq(person.first_name)
        expect(json.first['bio']).to eq(person.bio)
      end
    end

    context 'when providing scope parameters' do
      let(:params) { { first_name: person.first_name, last_name: person.last_name } }

      it 'returns an array with people with params as a scope' do
        expect(response).to have_http_status(:ok)
        expect(json.size).to eq(1)
        expect(json.first['first_name']).to eq(person.first_name)
        expect(json.first['bio']).to eq(person.bio)
      end
    end
  end

  describe 'Show' do
    before { get "/api/v1/people/#{id}" }

    context 'when getting an existing person' do
      let(:id) { person.id }

      it 'returns an object of the person' do
        expect(response).to have_http_status(:ok)
        expect(json.size).to eq(12)
        expect(json['first_name']).to eq(person.first_name)
        expect(json['bio']).to eq(person.bio)
      end
    end

    context 'when sending the wrong id' do
      let(:id) { 'wrong_id' }

      it 'returns an error message' do
        expect(response).to have_http_status(:ok)
        expect(json.size).to eq(2)
        expect(json['status']).to eq('error')
        expect(json['message']).to eq("Couldn't find Person with 'id'=wrong_id")
      end
    end
  end
end
