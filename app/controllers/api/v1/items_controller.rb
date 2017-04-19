module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_todo

      def index
        @items = @todo.items
        render json: @items, status: :ok
      end

      private

      def set_todo
        @todo = Todo.find(params[:todo_id])
      end
    end
  end
end
