class Api::V1::MapController < ApiController
  def discover
    requests = Request.available
      .within_radius(params[:latitude], params[:longitude], 30_000)
      .limit(500)

    render json: requests, each_serializer: Api::V1::RequestSerializer
  end
end

