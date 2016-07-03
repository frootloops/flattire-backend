class Api::V1::LocationController < ApiController
  def update
    current_driver.update!( latitude: params[:latitude], longitude: params[:longitude] )
    head :ok
  end
end

