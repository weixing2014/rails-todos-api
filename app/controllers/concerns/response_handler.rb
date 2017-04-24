module ResponseHandler
  def response(data, status: :ok)
    render json: data, status: status
  end
end
