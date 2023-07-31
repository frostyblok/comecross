class VisitsCategory < ApplicationRecord
  belongs_to :visit
  belongs_to :category

  has_many :visits_categories_ratings, dependent: :destroy
  has_many :ratings, through: :visits_categories_ratings, dependent: :destroy
end
