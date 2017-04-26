require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 10, created_by: user.id) }
  let(:todo_id) { todos.first.id }
  let(:invalid_todo_id) { 0 }
  let(:headers) { valid_headers }

  describe 'GET /todos' do
    before { get '/todos', params: {}, headers: headers }

    it 'returns todos' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /todos/:id' do
    context 'when :id is valid' do
      before { get "/todos/#{todo_id}", params: {}, headers: headers }

      it 'returns todo' do
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when :id is invalid' do
      before { get "/todos/#{invalid_todo_id}", params: {}, headers: headers  }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /todos/:id' do
    context 'when :id is valid' do
      before { delete "/todos/#{todo_id}", params: {}, headers: headers }

      it 'removes todo with :id from database' do
        expect(user.todos.size).to eq(9)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when :id is invalid' do
      before { delete "/todos/#{invalid_todo_id}", params: {}, headers: headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /todos' do
    context 'request is valid' do
      before {
        post "/todos", params: { title: 'New Todo' }.to_json, headers: headers
      }

      it 'creates a todo' do
        expect(json['title']).to eq('New Todo')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post "/todos", params: { title: '' }.to_json, headers: headers }

      it 'returns error messages' do
        expect(json['message']).to match(/Validation failed: Title can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /todos/:id' do
    let(:valid_params) { { title: 'New Todo' }.to_json }

    context 'request is valid' do
      before { put "/todos/#{todo_id}", params: valid_params, headers: headers }

      it 'updates the todo with :id' do
        expect(Todo.find(todo_id).title).to eq('New Todo')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when request is invalid' do
      before { put "/todos/#{invalid_todo_id}", params: valid_params, headers: headers }

      it 'returns error message' do
        expect(json['message']).to eq("Couldn't find Todo with 'id'=#{invalid_todo_id}")
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
