class Visit < ApplicationRecord
  belongs_to :user
  has_many :visits_categories, dependent: :destroy
  has_many :categories, through: :visits_categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :purge_later

  validates_presence_of :address
  validates :name, presence: true, uniqueness: { scope: :user_id, message: "You already have a visit with that name" }

  before_validation :update_coordinates, if: :address_changed?

  accepts_nested_attributes_for :comments, reject_if: proc { |att| att['text'].blank? }

  private

  def update_coordinates
    geo = Geocoder.search(address).first
    return self.errors.add(:base, "Address does not exist") unless geo.present?

    self.latitude = geo.data['lat']
    self.longitude = geo.data['lon']
  end
end
