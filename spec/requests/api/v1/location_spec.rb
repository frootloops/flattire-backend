require 'spec_helper'

describe Api::V1::LocationController, type: :request do
  describe "POST #update" do
    it "returns 401 error" do
      post '/api/v1/location', {}
      expect(response).to have_http_status(:unauthorized)

      headers = { "X-Driver-Token": "FAKE" }
      post '/api/v1/location', {}, headers
      expect(response).to have_http_status(:unauthorized)
    end

    it "updates driver's location" do
      driver = create(:driver)
      headers = { "X-Driver-Token": driver.authentication_token }
      lat, lon = 55.882224, 37.706374
      post '/api/v1/location', { latitude: lat, longitude: lon }, headers
      expect(response).to be_success
      driver.reload
      expect(driver.latitude).to eql(lat)
      expect(driver.longitude).to eql(lon)
    end
  end
end
