require 'rails_helper'

describe Request, type: :model do
  it { expect(Request.new).to belong_to(:driver) }
  it { expect(Request.new).to validate_presence_of(:driver) }
  it { expect(Request.new).to validate_presence_of(:status) }
  it { expect(Request.new).to validate_presence_of(:cause) }
  it { expect(Request.new).to validate_presence_of(:address) }
  it { expect(Request.new).to validate_presence_of(:latitude) }
  it { expect(Request.new).to validate_presence_of(:longitude) }

  describe ".within_radius" do
    it "returns drivers within radius" do
      r0 = create :request, latitude: 55.882224, longitude: 37.706374
      r1 = create :request, latitude: 55.884943, longitude: 37.705457
      create :request, latitude: 55.884304, longitude: 37.689535

      nears = Request.within_radius(55.883315, 37.705693, 300).pluck(:id)
      expect(nears).to eql([r0.id, r1.id])
    end
  end
end
