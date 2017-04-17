require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  describe 'GET /api/v1/todos' do
    before { get '/api/v1/todos' }

    it 'returns todos' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/todos/:id' do
    context 'when :id is valid' do
      before { get "/api/v1/todos/#{todo_id}" }

      it 'returns todo' do
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when :id is invalid' do
      # Todo
    end
  end

  describe 'DELETE /api/v1/todos/:id' do
    context 'when :id is valid' do
      before { delete "/api/v1/todos/#{todo_id}" }

      it 'removes todo with :id from database' do
        expect(Todo.all.size).to eq(9)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when :id is invalid' do
      # Todo
    end
  end
end
