require 'rails_helper'

describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price_of_admission }
  end

  it "can convert price to string" do
    amusement_park = AmusementPark.create!({
      name: "Hershey Park",
      price_of_admission: 50
      })

    expect(amusement_park.convert_price).to eq("$50.00")
  end
end