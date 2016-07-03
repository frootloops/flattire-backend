class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for Driver, fallback_to_devise: false
  before_filter :authenticate_driver!

  protected

  def auth_token
    request.headers["HTTP_X_DRIVER_TOKEN"]
  end
end

