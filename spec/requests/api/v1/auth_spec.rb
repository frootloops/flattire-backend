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

  describe "POST #send_code" do
    it "creates new driver and send sms" do
      expect(SendCodeJob).to receive(:perform_later).once 
      post '/api/v1/auth/send_code', { phone: '+79999808630' }
      expect(Driver.count).to eql(1)
    end
  end

  describe "POST #sign_in" do
    it "returns a token" do
      driver = create :driver
      post '/api/v1/auth/sign_in', { phone: driver.phone, code: driver.otp_code }
      token = JSON.parse(response.body)["access_token"]
      expect(token).to eql(driver.reload.authentication_token)
    end

    it "returns 401 error" do
      driver = create :driver
      post '/api/v1/auth/sign_in', { phone: driver.phone, code: "WRONG" }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "POST #log_out" do
    it "changes an authentication_token" do
      driver = create :driver
      post '/api/v1/auth/log_out', {}, { "X-Driver-Token": driver.authentication_token }
      expect {
        driver.reload
      }.to change(driver, :authentication_token)
    end

    it "returns 401" do
      post '/api/v1/auth/log_out', {}, { "X-Driver-Token": "" }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
