require 'rails_helper'

describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
end