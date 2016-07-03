class Api::V1::AuthController < ApiController
  skip_before_filter :authenticate_driver!, only: [:send_code, :log_in]

  def send_code
    driver = Driver.find_or_create_by!(phone: params[:phone])
    SendCodeJob.perform_later(driver_id: driver.id)
    render nothing: true
  end

  def log_in
    driver = Driver.find_by!(phone: params[:phone])
    return head(:unauthorized) unless driver.authenticate_otp(params[:code])
    render json: driver
  end

  def log_out
    current_driver.authentication_token = ""
    current_driver.save!
    render nothing: true
  end

  def hello
    render nothing: true
  end

end
