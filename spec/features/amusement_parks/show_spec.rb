require 'rails_helper'

describe "As a visitor" do
  describe "When I visit an amusement park's show page" do
    before(:each) do
      @amusement_park = AmusementPark.create!({
        name: "Hershey Park",
        price_of_admission: 50
        })
    end
    it "I see the name and price of admissions for that amusement park" do
      visit "/amusement_parks/#{@amusement_park.id}"

      expect(page).to have_content("#{@amusement_park.name}")
      expect(page).to have_content("$#{@amusement_park.price_of_admission}.00")
    end
  end
end