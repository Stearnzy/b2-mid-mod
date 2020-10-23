require 'rails_helper'

describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price_of_admission }
  end

  before(:each) do
    @amusement_park = AmusementPark.create!({
      name: "Hershey Park",
      price_of_admission: 50
      })

    @ride_1 = Ride.create!({
      name: "Lightning Racer",
      thrill_rating: 9,
      amusement_park_id: "#{@amusement_park.id}"
      })

    @ride_2 = Ride.create!({
      name: "Storm Runner",
      thrill_rating: 7,
      amusement_park_id: "#{@amusement_park.id}"
      })

    @ride_3 = Ride.create!({
      name: "The Great Bear",
      thrill_rating: 6,
      amusement_park_id: "#{@amusement_park.id}"
      })
  end

  it "can convert price to string" do
    expect(@amusement_park.convert_price).to eq("$50.00")
  end

  it "can average the park's rides' thrill ratings" do
    expect(@amusement_park.ride_rating_average.round(1)).to eq(7.3)
  end
end