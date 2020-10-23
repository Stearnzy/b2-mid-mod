require 'rails_helper'

describe Ride, type: :model do
  describe "relationships" do
    it { should have_many :mechanics }
    it { should belong_to :amusement_park }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
  end
end