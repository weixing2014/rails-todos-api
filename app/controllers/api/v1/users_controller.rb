module Api
  module V1
    class UsersController < ApplicationController
      def create
        User.create!(permitted_params)
        render json: { message: 'User created successfully.' }, status: :created
      end

      private

      def permitted_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
