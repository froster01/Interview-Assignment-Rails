class SessionsController < ApplicationController
  skip_before_action :auth_request, only: [ :login ]

  def login
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render_success("Succesfully Login.", { token: token })

    else
      render_error("Invalid Username of Password", "unauthorized", :unauthorized)
    end
  end

  def logout
    render_success("Logged Out Succesfully.")
  end
end
