# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Links', type: :request do
  context 'when logged in' do 
    describe 'GET /links.json' do
      let(:user) { create(:user) }
      before do
        sign_in user
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

    describe 'GET /search' do
      let(:user) { create(:user) }
      before do
        sign_in user
        FactoryBot.create_list(:link, 4)
        FactoryBot.create(:link, title: 'A stevie')
        get '/search', :params => { :term => "Stevie", :format => :json }
      end

      it 'returns all links' do
        json = JSON.parse(response.body)
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST /links'do
      let(:user) { create(:user) }
      let(:params) { { title: 'pizza foobar', page: 'http://asdf' } }

      it 'creates a link' do
        sign_in user
        post '/links', params: params, as: :json
        expect(response).to have_http_status(:created)
      end
    end
  end
  
  context 'when logged out' do 
    describe 'GET /links.json' do
      before do
        FactoryBot.create_list(:link, 10)
        get '/links.json'
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET /search' do
      before do
        FactoryBot.create_list(:link, 4)
        FactoryBot.create(:link, title: 'A stevie')
        get '/search', :params => { :term => "Stevie", :format => :json }
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST /links'do
      let(:user) { create(:user) }
      let(:params) { { title: 'pizza foobar', page: 'http://asdf' } }

      it 'returns status code 401' do 
        post '/links', params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
