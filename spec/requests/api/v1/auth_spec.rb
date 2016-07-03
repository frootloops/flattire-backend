require 'spec_helper'

describe Api::V1::AuthController, type: :request do
  describe "GET #hello" do
    it "returns 401 error" do
      get '/api/v1/auth/hello', {}
      expect(response).to have_http_status(:unauthorized)

      headers = { "X-Driver-Token": "FAKE" }
      get '/api/v1/auth/hello', {}, headers
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns 200 ok" do
      driver = create(:driver)
      headers = { "X-Driver-Token": driver.authentication_token }
      get '/api/v1/auth/hello', {}, headers
      expect(response).to be_success
    end
  end
end

