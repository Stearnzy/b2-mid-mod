require 'rails_helper'

describe "As a user" do
  describe "When I visit a mechanics index page" do
    it "I see a header saying 'All Mechanics'" do
      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
    end

    it "I see a list of all mechanic's names and their years of experience" do
      mechanic_1 = Mechanic.create!({
        name: "Sam Mills",
        years_of_experience: 10
        })

      mechanic_2 = Mechanic.create!({
        name: "Kara Smith",
        years_of_experience: 11
        })

      visit "/mechanics"

      within "#mechanic-#{mechanic_1}" do
        expect(page).to have_content("#{mechanic_1.name} - #{mechanic_1.years_of_experience} years of experience")
      end

      within "#mechanic-#{mechanic_2}" do
        expect(page).to have_content("#{mechanic_2.name} - #{mechanic_2.years_of_experience} years of experience")
      end
    end
  end
end