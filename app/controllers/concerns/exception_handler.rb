module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingTokenError < StandardError; end
  class InvalidTokenError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingTokenError, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidTokenError, with: :four_twenty_two

    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
  end

  private

  def four_twenty_two(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def unauthorized_request(e)
    render json: { message: e.message }, status: :unauthorized
  end
end
