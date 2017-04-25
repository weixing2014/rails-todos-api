require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:headers) { valid_headers.except('Authorization') }

  describe 'POST /api/v1/auth/login' do
    let!(:user) { create(:user) }
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context 'When request is valid' do
      before do
        post '/api/v1/auth/login', params: valid_credentials, headers: headers
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'When request is invalid' do
      before do
        post '/api/v1/auth/login', params: invalid_credentials, headers: headers
      end

      it 'returns an error message' do
        expect(json['message']).to eq("Invalid credentials")
      end
    end
  end

  describe 'POST /api/v1/auth/signup' do
    let(:user) { build(:user) }
    let(:valid_attributes) do
      attributes_for(:user, password_confirmation: user.password)
    end

    context 'When valid request' do
      before do
        post '/api/v1/auth/signup', params: valid_attributes.to_json, headers: headers
      end

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/success/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'When invalid request' do
      before do
        post '/api/v1/auth/signup', params: {}, headers: headers
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json['message']).to match(/Name can't be blank/)
      end
    end
  end
end
