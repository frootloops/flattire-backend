class SendCodeJob < ApplicationJob
  queue_as :default

  def perform(driver_id:)
    driver = Driver.find(driver_id)

    client = Twilio::REST::Client.new
    client.messages.create(from: ENV['TWILIO_FROM'], to: driver.phone,
                           body: "Code: #{driver.otp_code}")
  end
end

