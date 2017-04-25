module Api
  module V1
    class ItemsController < ApplicationController
      before_action :find_todo
      before_action :find_item, only: [:show, :update, :destroy]

      def index
        @items = @todo.items
        json_response(@items)
      end

      def show
        json_response(@item)
      end

      def update
        @item.update_attributes(name: params[:name], done: params[:done])
        head :no_content
      end

      def destroy
        @item.destroy
        head :no_content
      end

      def create
        @item = Item.create!(permitted_params)
        json_response(@item)
      end

      private

      def permitted_params
        params.permit(:todo_id, :name, :done)
      end

      def find_todo
        @todo = Todo.find(params[:todo_id])
      end

      def find_item
        @item = @todo.items.find(params[:id])
      end
    end
  end
end
