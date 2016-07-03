class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for Driver, if: ->(controller) do
    controller.driver_token_authenticable?
  end

  protected

  def driver_token_authenticable?
    true
  end
end
