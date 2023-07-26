class Category < ApplicationRecord
  has_many :visits_categories
  has_many :visits, through: :visits_categories
  has_many :category_ratings
  has_many :ratings, through: :category_ratings

  accepts_nested_attributes_for :ratings

  validates_presence_of :name
end
