class User < ApplicationRecord
  has_many :visits

  validates_presence_of :first_name, :last_name, :email
end
