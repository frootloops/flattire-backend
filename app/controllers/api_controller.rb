class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :authenticate

  private

  def authenticate
    authenticate_driver_by_token! && authenticate_driver!
  end

  def authenticate_driver_by_token!
    render status: :unauthorized
  end
end

