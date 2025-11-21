class RegistrationsController < ApplicationController
 skip_before_action :auth_request, only: [ :create ]

 def create
   user = User.new(user_params)

   if user.save
     render json: { message: "User Created" }, status: :created
   else
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
   end
 end

 private

 def user_params
   params.require(:user).permit(:username, :password, :password_confirmation)
 end
end
