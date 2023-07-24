class Category < ApplicationRecord
  has_many :visits_categories
  has_many :visits, through: :visits_categories

  validates_presence_of :name
end
