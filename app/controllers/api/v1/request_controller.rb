class Api::V1::RequestController < ApiController

  def index
    requests = Request.where(driver: current_driver)
    render json: requests, each_serializer: Api::V1::RequestSerializer
  end

  def create
    request = Request.new(request_params)
    request.driver = current_driver
    request.save!

    render json: request, serializer: Api::V1::RequestSerializer
  end

  def done
    update_status :done
  end


  def cancel
    update_status :canceled
  end

  private

  def request_params
    params.require(:request).permit(:address, :cause, :latitude, :longitude)
  end

  def update_status(status)
    request = current_driver.requests.find(params[:id])
    request.status = status
    request.save

    render json: request, serializer: Api::V1::RequestSerializer
  end
end

