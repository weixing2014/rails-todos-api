module Api
  module V1
    class TodosController < ApplicationController
      before_action :find_todo, only: [:show, :update, :destroy]

      def index
        @todos = Todo.all

        render json: @todos, status: :ok
      end

      def show
        render json: @todo, status: :ok
      end

      def create
        @todo = Todo.new(permitted_params)

        if @todo.save
          render json: @todo, status: :ok
        else
          render json: { errors: @todo.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @todo.destroy
        head :no_content
      end

      def update
        @todo.update_attributes(permitted_params)
        head :no_content
      end

      private

      def permitted_params
        params.permit(:title, :created_by)
      end

      def find_todo
        @todo = Todo.find(params[:id])
      end
    end
  end
end
