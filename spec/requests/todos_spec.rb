require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:todos) { create_list(:todo, 10) }

  describe 'GET /api/v1/todos' do
    before { get '/api/v1/todos' }

    it 'returns todos' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
