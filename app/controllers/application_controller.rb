class ApplicationController < ActionController::API
  include Response
  include Pagy::Backend
  before_action :auth_request

  def jwt_encode(payload)
    payload[:exp] = 24.hours.from_now.to_i
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def jwt_decode(token)
    decode = JWT.decode(token, Rails.application.secret_key_base)[0]
    HashWithIndifferentAccess.new decode
  end

  private
  def auth_request
    header = request.headers["Authorization"]
    token = header.split.last if header.present?

    begin
      decode = jwt_decode(token)
      @current_user = User.find(decode[:user_id])
    rescue
      render_error("Authentication request failed.", "Unauthorized")
    end
  end
end
