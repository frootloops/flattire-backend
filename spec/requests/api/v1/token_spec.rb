require 'spec_helper'

describe Api::V1::TokenController, type: :request do
  describe "POST #token/request" do
    it "sends sms code" do
      expect(SendCodeJob).to receive(:perform_later).once 
      post '/api/v1/token/request', { phone: '+79999808630' }
      expect(Driver.count).to eql(1)
    end
  end

  describe "POST #token" do
    it "returns a token" do
      driver = create :driver
      post '/api/v1/token', { phone: driver.phone, code: driver.otp_code }
      token = JSON.parse(response.body)["token"]
      expect(token).to eql(driver.reload.authentication_token)
    end
  end
end
