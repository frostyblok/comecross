class VisitsCategoriesRating < ApplicationRecord
  belongs_to :visits_category
  belongs_to :rating

  delegate :category, to: :visits_category, prefix: false
  delegate :name, to: :category, prefix: true
end
