class Visit < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :address, :latitude, :longitude
end
