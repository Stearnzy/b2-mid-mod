class AmusementPark < ApplicationRecord
  validates_presence_of :name, :price_of_admission
  has_many :rides

  def convert_price
    "$#{self.price_of_admission}.00"
  end

  def ride_rating_average
    rides.average(:thrill_rating)
  end
end