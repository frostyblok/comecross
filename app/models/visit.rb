class Visit < ApplicationRecord
  belongs_to :user
  has_many :visits_categories
  has_many :categories, through: :visits_categories
  has_many :comments
  has_many_attached :images

  validates_presence_of :address, :latitude, :longitude
  validates :name, presence: true, uniqueness: { scope: :user_id, message: "You already have a visit with that name" }

  before_validation :update_coordinates, if: :address_changed?

  accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['name'].blank? }

  private

  def update_coordinates
    geo = Geocoder.search(address).first
    return unless geo.present?

    self.latitude = geo.data['lat']
    self.longitude = geo.data['lon']
  end
end
