require 'rails_helper'

describe 'Items API' do
  let!(:todo) { create(:todo) }
  let!(:items) { create_list(:item, 20, todo_id: todo.id) }
  let(:todo_id) { todo.id }
  let(:invalid_todo_id) { 0 }
  let(:item_id) { items.first.id }

  describe 'GET /todos/:todo_id/items' do
    context 'when todo exists' do
      before { get "/api/v1/todos/#{todo_id}/items" }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all todo items' do
        expect(json.size).to eq(20)
      end
    end

    context 'when todo does not exist' do
      before { get "/api/v1/todos/#{invalid_todo_id}/items" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end