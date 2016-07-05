class Api::V1::DriverController < ApiController

  def me
    render json: current_driver, serializer: Api::V1::DriverSerializer
  end

end
