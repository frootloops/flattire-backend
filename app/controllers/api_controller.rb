class ApiController < ApplicationController
  include ActionController::Serialization

  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for Driver, fallback_to_devise: false
  before_action :authenticate_driver!

  protected

  def auth_token
    request.headers["HTTP_X_DRIVER_TOKEN"]
  end

end

