require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :rides }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_of_experience }
  end

  it "Can order the rides in alphabetical order" do
    @mechanic_1 = Mechanic.create!({
      name: "Sam Mills",
      years_of_experience: 10
      })

    @amusement_park_1 = AmusementPark.create!({
      name: "Hershey Park",
      price_of_admission: 50
      })

    @amusement_park_2 = AmusementPark.create!({
      name: "Elitch's",
      price_of_admission: 35
      })

    @ride_1 = Ride.create!({
      name: "Lightning Racer",
      thrill_rating: 9,
      amusement_park_id: "#{@amusement_park_1.id}"
      })

    @ride_3 = Ride.create!({
      name: "Storm Runner",
      thrill_rating: 7,
      amusement_park_id: "#{@amusement_park_1.id}"
      })

    @ride_2 = Ride.create!({
      name: "Tower of Doom",
      thrill_rating: 9,
      amusement_park_id: "#{@amusement_park_2.id}"
      })

    @ride_mech_1 = RideMechanic.create!({
      ride_id: @ride_1.id,
      mechanic_id: @mechanic_1.id
      })

    @ride_mech_2 = RideMechanic.create!({
      ride_id: @ride_3.id,
      mechanic_id: @mechanic_1.id
      })

    @ride_mech_3 = RideMechanic.create!({
      ride_id: @ride_2.id,
      mechanic_id: @mechanic_1.id
      })

    expect(@mechanic_1.rides_ordered).to eq([@ride_1, @ride_3, @ride_2])
  end
end