class Rating < ApplicationRecord
  has_many :category_ratings
  has_many :categories, through: :category_ratings

  validates_presence_of :value
end
