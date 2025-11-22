class SessionsController < ApplicationController
  skip_before_action :auth_request, only: [ :create ]
  before_action :auth_request, only: [ :destroy ]

  def create
    user = User.find_by(username: user_params[:username])

    if user&.authenticate(user_params[:password])
      user.update_column(:auth_token, SecureRandom.hex(20))

      render_success("Succesfully Login.", { token: user.auth_token })

    else
      render_error("Invalid Username of Passowrd!", "unauthorized", :unauthorized)
    end
  end

  def destroy
    @current_user.update_column(:auth_token, nil)

    render_success("Logged Out Succesfully.", { token: @current_user.auth_token })
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
