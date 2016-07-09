require 'spec_helper'

describe Api::V1::DriverController, type: :request do
  describe "GET #me" do
    it "returns 401 error" do
      get '/api/v1/me', {}
      expect(response).to have_http_status(:unauthorized)

      headers = { "X-Driver-Token": "FAKE" }
      get '/api/v1/me', {}, headers
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns 200 ok" do
      driver = create(:driver)
      create(:request, driver: driver)
      headers = { "X-Driver-Token": driver.authentication_token }
      get '/api/v1/me', {}, headers
      expect(response).to be_success

      data = JSON.parse(response.body)
      expect(data["phone"]).to eql(driver.phone)
    end
  end

  describe "POST #me" do
    it "updates current driver" do
      driver = create(:driver, name: "Armen")
      headers = { "X-Driver-Token": driver.authentication_token }
      post '/api/v1/me', { driver: { name: "Arsen" } }, headers

      expect do
        driver.reload
      end.to change { driver.name }.from("Armen").to("Arsen")
      expect(response).to be_success
    end
  end
end

