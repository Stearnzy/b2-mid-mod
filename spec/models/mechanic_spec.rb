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
end