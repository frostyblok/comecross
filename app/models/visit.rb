class Visit < ApplicationRecord
  belongs_to :user
  has_many :visits_categories
  has_many :categories, through: :visits_categories

  validates_presence_of :address, :latitude, :longitude
  validates :name, presence: true, uniqueness: { scope: :user_id, message: "You already have a visit with that name" }

  before_validation :update_coordinates, if: :address_changed?

  private

  def update_coordinates
    geo = Geocoder.search(address).first
    return unless geo.present?

    self.latitude = geo.data['lat']
    self.longitude = geo.data['lon']
  end
end
