module Api
  module V1
    module Auth
      class AuthenticationController < ApplicationController
        def login
          auth_token = AuthenticateUser.new(permitted_params[:email], permitted_params[:password]).call
          json_response(auth_token: auth_token)
        end

        def signup
          user = User.create!(permitted_params)
          auth_token = AuthenticateUser.new(user.email, user.password).call
          render json: {
            message: 'User created successfully.',
            auth_token: auth_token,
          }, status: :created
        end

        private

        def permitted_params
          params.permit(:name, :email, :password, :password_confirmation)
        end
      end
    end
  end
end
