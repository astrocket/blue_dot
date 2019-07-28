class City < ApplicationRecord
  has_many :travelings
  has_many :worlds, through: :travelings
end
