require 'spec_helper'

describe Api::V1::MapController, type: :request do
  describe "GET #index" do
    it "returns 401 error" do
      get '/api/v1/map', {}
      expect(response).to have_http_status(:unauthorized)

      headers = { "X-Driver-Token": "FAKE" }
      get '/api/v1/map', {}, headers
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns current requests" do
      driver = create(:driver)
      headers = { "X-Driver-Token": driver.authentication_token }
      lat, lon = 55.882224, 37.706374
      create(:request, latitude: lat, longitude: lon)
      get '/api/v1/map', { latitude: lat, longitude: lon }, headers
      expect(response).to be_success

      requests = JSON.parse(response.body)
      expect(requests.count).to eql(1)
    end
  end
end
