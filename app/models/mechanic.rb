class Mechanic < ApplicationRecord
  validates_presence_of :name, :years_of_experience
  belong_to :ride
  has_many :rides
end