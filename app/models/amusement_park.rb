class AmusementPark < ApplicationRecord
  validates_presence_of :name, :price_of_admission
  has_many :rides
end