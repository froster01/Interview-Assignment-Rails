module Response
  def render_success(message, data = {}, status = :ok)
    render json: {
      status: "success",
      message: message,
      data: data
    }, status: status
  end

  def render_error(message, error = nil, status = :unprocessable_entity)
    render json: {
      status: "error",
      message: message,
      error: error
    }, status: status
  end
end
