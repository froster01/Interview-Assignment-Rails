class SessionsController < ApplicationController
  skip_before_action :auth_request, only: [ :create ]
  before_action :auth_request, only: [ :destroy ]

  def create
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])

      render json: { status: "success", token: user.auth_token, message: "Logged in!" }, status: :ok
    else
      render json: { status: "error", message: "Invalid Username or Password" }, status: :unauthorized
    end
  end

  def destroy
    @current_user.update_column(:auth_token, SecureRandom.hex(20))
    render json: { message: "logged Out Success!" }, status: :ok
  end
end

private
def user_params
  params.require(:user).permit(:username, :password)
end
