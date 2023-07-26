class CategoryRating < ApplicationRecord
  belongs_to :rating
  belongs_to :category
end
