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

  describe ".within_radius" do
    it "returns drivers within radius" do
      d0 = create :driver, latitude: 55.882224, longitude: 37.706374
      d1 = create :driver, latitude: 55.884943, longitude: 37.705457
      create :driver, latitude: 55.884304, longitude: 37.689535

      nears = Driver.within_radius(55.883315, 37.705693, 300).pluck(:id)
      expect(nears).to eql([d0.id, d1.id])
    end
  end
end
