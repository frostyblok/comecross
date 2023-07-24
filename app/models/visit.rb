class Visit < ApplicationRecord
  belongs_to :user
  has_many :visits_categories
  has_many :categories, through: :visits_categories

  validates_presence_of :name, :address, :latitude, :longitude
end
