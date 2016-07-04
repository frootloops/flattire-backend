require 'spec_helper'

describe Api::V1::RequestController, type: :request do
  describe "GET #index" do
    it "returns 401 error" do
      get '/api/v1/requests', {}
      expect(response).to have_http_status(:unauthorized)

      headers = { "X-Driver-Token": "FAKE" }
      get '/api/v1/requests', {}, headers
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns 200 ok" do
      driver = create(:driver)
      create(:request, driver: driver)
      headers = { "X-Driver-Token": driver.authentication_token }
      get '/api/v1/requests', {}, headers
      expect(response).to be_success

      requests = JSON.parse(response.body)["requests"]
      expect(requests.count).to eql(1)
    end
  end

  describe "POST #create" do
    it "creates new request" do
      driver = create :driver
      headers = { "X-Driver-Token": driver.authentication_token }
      expect do
        params = { address: "Address", cause: "Cause", latitude: 1, longitude: 1 }
        post '/api/v1/requests', { request: params }, headers
      end.to change(Request, :count).by(1)
      expect(response).to be_success
    end
  end

  describe "POST #done" do
   it "dones an existing request" do
      driver = create :driver
      request = create(:request, driver: driver)
      headers = { "X-Driver-Token": driver.authentication_token }
    
      expect do 
        post '/api/v1/requests/done', { request_id: request.id }, headers
        request.reload
      end.to change { request.status }.to("done")
    end
  end

  describe "POST #cancel" do
    it "cancels an existing request" do
      driver = create :driver
      request = create(:request, driver: driver)
      headers = { "X-Driver-Token": driver.authentication_token }
    
      expect do 
        post '/api/v1/requests/cancel', { request_id: request.id }, headers
        request.reload
      end.to change { request.status }.to("canceled")
    end
  end
end
