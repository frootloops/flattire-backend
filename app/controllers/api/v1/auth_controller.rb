class Api::V1::AuthController < ApiController
  def create
  end

  def hello
    render nothing: true
  end

  protected

  def traveler_token_authenticable?
    %w(hello).include?(action_name) ? true : super
  end
end

