class VisitsCategory < ApplicationRecord
  belongs_to :visit
  belongs_to :category
end
