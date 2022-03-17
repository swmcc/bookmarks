# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'GET /links.json' do
    before do
      FactoryBot.create_list(:link, 10)
      get '/links.json'
    end

    it 'returns all links' do
      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
