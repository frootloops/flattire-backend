require 'rails_helper'

describe SendCodeJob, type: :job do
  it "sends sms to a driver" do
    driver = create(:driver)
    expect do
      SendCodeJob.perform_now(driver_id: driver.id)
    end.to change { FakeSMS.messages.count }
  end
end

