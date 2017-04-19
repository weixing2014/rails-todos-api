require 'rails_helper'

describe 'Items API' do
  let!(:todo) { create(:todo) }
  let!(:items) { create_list(:item, 20, todo_id: todo.id) }
  let(:todo_id) { todo.id }
  let(:invalid_todo_id) { 0 }
  let(:item_id) { items.first.id }
  let(:item) { Item.find(item_id) }
  let(:invalid_item_id) { 0 }

  describe 'GET /api/v1/todos/:todo_id/items' do
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

  describe 'GET /api/v1/todos/:todo_id/items/:id' do
    context 'when item id exist' do
      before { get "/api/v1/todos/#{todo_id}/items/#{item_id}" }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['name']).to eq(items.first.name)
      end
    end

    context 'when item id does not exist' do
      before { get "/api/v1/todos/#{todo_id}/items/#{invalid_item_id}" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'PUT /api/v1/todos/:todo_id/items/:id' do
    context 'when item id exist' do
      before { put "/api/v1/todos/#{todo_id}/items/#{item_id}", params: { name: 'Hello Kitty', done: true } }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        expect(item.name).to eq('Hello Kitty')
        expect(item.done).to eq(true)
      end
    end
  end

  describe 'POST /api/v1/todos/:todo_id/items' do
    context 'when todo id exist' do
      before { post "/api/v1/todos/#{todo_id}/items", params: { name: 'Hello Kitty' } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'creates the item' do
        expect(json['name']).to eq('Hello Kitty')
        expect(json['done']).to eq(false)

        expect(Item.all.size).to eq(21)
      end
    end
  end

  describe 'Delete /api/v1/todos/:todo_id/items/:item_id' do
    context 'when todo id exist' do
      before { delete "/api/v1/todos/#{todo_id}/items/#{item_id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'removes the item from database' do
        expect(Item.all.size).to eq(19)
      end
    end
  end
end
