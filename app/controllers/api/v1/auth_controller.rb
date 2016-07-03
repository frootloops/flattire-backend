class Api::V1::AuthController < ApiController

  def send_code
    driver = Driver.find_or_create_by!(phone: params[:phone])
    SendCodeJob.perform_async(driver_id: driver.id)
    render nothing: true
  end

  def hello
    render nothing: true
  end

  protected

  def traveler_token_authenticable?
    %w(hello).include?(action_name) ? true : super
  end
end

