class UsersController < ApplicationController
  skip_before_action :auth_request, only: [ :create ]

  def index
    user = User.all
    render_success("List all users: ", user)
  end

  def create
    user = User.new(user_params)
    if user.save
      render_success("User registered succesfully.", user, status: :created)
    else
      render_error("Registration failed.", user.errors.full_messages)
    end
  end

  def show
    render_success("Selected user detail: ", @user)
  end

  def update
    if @user.update
      render_success("User updated succesfully.", @user)
    end
  end

  def destroy
    @user.destroy
    headers :no_content
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(params[:id])
  end
end
