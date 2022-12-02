# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  context 'when logged in as an administrator' do 
    describe 'GET /admin' do
      let!(:user) { create :user, :admin }
      before do
        sign_in user
        get '/admin'
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  context 'when logged in as a user' do 
    describe 'GET /admin' do
      let!(:user) { create :user }
      before do
        sign_in user
        get '/admin'
      end

      it 'returns status code 302' do
        expect(response).to have_http_status(:found)
      end
    end
  end

  context 'when logged out' do 
    describe 'GET /admin' do
      #let!(:user) { create :user }
      before do
        get '/admin'
      end

      it 'returns status code 302' do
        expect(response).to have_http_status(:found)
      end
    end
  end
end
