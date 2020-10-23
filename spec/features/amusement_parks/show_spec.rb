require 'rails_helper'

describe "As a visitor" do
  describe "When I visit an amusement park's show page" do
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

    it "I see the name and price of admissions for that amusement park" do
      visit "/amusement_parks/#{@amusement_park.id}"

      expect(page).to have_content("#{@amusement_park.name}")
      expect(page).to have_content("$#{@amusement_park.price_of_admission}.00")
    end

    it "I see the names of all the rides that are at that park" do
      visit "/amusement_parks/#{@amusement_park.id}"

      expect(page).to have_content("Rides:")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")
      expect(page).to have_content("#{@ride_3.name}")
    end
  end
end