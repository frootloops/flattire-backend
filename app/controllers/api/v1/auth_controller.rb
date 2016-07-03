class Api::V1::AuthController < ApiController
  skip_before_filter :authenticate_driver!, only: [:send_code]

  def send_code
    driver = Driver.find_or_create_by!(phone: params[:phone])
    SendCodeJob.perform_later(driver_id: driver.id)
    render nothing: true
  end

  def hello
    render nothing: true
  end

end
