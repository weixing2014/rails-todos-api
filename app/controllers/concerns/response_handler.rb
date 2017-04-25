module ResponseHandler
  def json_response(data, status: :ok)
    render json: data, status: status
  end
end
