class World < ApplicationRecord
  belongs_to :user

  has_many :travelings
  has_many :cities, through: :travelings
end
