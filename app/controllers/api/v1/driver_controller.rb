class Api::V1::DriverController < ApiController

  def me
    render json: current_driver, serializer: Api::V1::DriverSerializer
  end

  def update
    current_driver.update!(driver_params)

    render json: current_driver, serializer: Api::V1::DriverSerializer
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :email, :push_token)
  end

end
