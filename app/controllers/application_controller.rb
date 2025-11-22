class ApplicationController < ActionController::API
  include Response
  before_action :auth_request

  private

  def auth_request
    token = request.headers["Authorization"]

    if token.blank?
      render json: { error: "Token is Missing" }, status: :unauthorized and return
    end

    token = token.split(" ").last
    @current_user = User.find_by(auth_token: token)
    unless @current_user
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
end
