module V1
  class TodosController < ApplicationController
    before_action :find_todo, only: [:show, :update, :destroy]

    def index
      @todos = current_user.todos
      json_response(@todos)
    end

    def show
      render json: @todo, status: :ok
    end

    def create
      @todo = @current_user.todos.create!(permitted_params)
      json_response(@todo, :created)
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
      params.permit(:title)
    end

    def find_todo
      @todo = Todo.find(params[:id])
    end
  end
end
