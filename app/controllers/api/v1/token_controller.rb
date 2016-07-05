class Api::V1::TokenController < ApiController
  skip_before_action :authenticate_driver!, only: [:send_code, :check_code]

  def send_code
    driver = Driver.find_or_create_by!(phone: params[:phone])
    SendCodeJob.perform_later(driver_id: driver.id)
    head :ok
  end

  def check_code
    driver = Driver.find_by!(phone: params[:phone])
    return head(:unauthorized) unless driver.authenticate_otp(params[:code])
    render json: driver, serializer: Api::V1::TokenSerializer
  end

end
