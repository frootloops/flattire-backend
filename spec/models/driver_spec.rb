require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe "validation" do
    it "number validation" do
      driver = build(:driver, phone: "+79999808630")
      expect(driver).to be_valid

      driver.phone = "+1-800-MY-APPLE"
      expect(driver).to_not be_valid
    end
  end
end
