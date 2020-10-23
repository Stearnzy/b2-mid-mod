require 'rails_helper'

describe "As a user" do
  describe "When I go to a mechanics show page" do
    before(:each) do
      @mechanic_1 = Mechanic.create!({
        name: "Sam Mills",
        years_of_experience: 10
        })

      @mechanic_2 = Mechanic.create!({
        name: "Kara Smith",
        years_of_experience: 11
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

      @ride_2 = Ride.create!({
        name: "Storm Runner",
        thrill_rating: 7,
        amusement_park_id: "#{@amusement_park_1.id}"
        })

      @ride_3 = Ride.create!({
        name: "Tower of Doom",
        thrill_rating: 9,
        amusement_park_id: "#{@amusement_park_2.id}"
        })

      @ride_mech_1 = RideMechanic.create!({
        ride_id: @ride_1.id,
        mechanic_id: @mechanic_1.id
        })

      @ride_mech_1 = RideMechanic.create!({
        ride_id: @ride_3.id,
        mechanic_id: @mechanic_1.id
        })

      @ride_mech_1 = RideMechanic.create!({
        ride_id: @ride_2.id,
        mechanic_id: @mechanic_2.id
        })
    end

    it "I see their name, years of experience, and names of all the rides they're
        working on" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content("Mechanic: #{@mechanic_1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_1.years_of_experience}")
      expect(page).to have_content("Current rides they're working on:")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_3.name}")
    end

    it "I see a form to add a ride to their workload" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content("Add ride to mechanic profile")
      expect(page).to have_content("Add ride id:")
      expect(page).to have_field(:ride_id)
    end
  end
end