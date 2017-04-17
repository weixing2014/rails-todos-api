module Api
  module V1
    class TodosController < ApplicationController
      before_action :find_todo, only: [:show, :destroy]

      def index
        todos = Todo.all

        render json: todos, status: :ok
      end

      def show
        render json: @todo, status: :ok
      end

      def destroy
        @todo.destroy
        head :no_content
      end

      private

      def find_todo
        @todo = Todo.find(params[:id])
      end
    end
  end
end
