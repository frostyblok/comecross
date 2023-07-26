class Comment < ApplicationRecord
  belongs_to :visit

  validates_presence_of :text
end
