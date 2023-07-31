require 'rails_helper'

RSpec.describe Visit, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:categories) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }

  describe "Uniqueness" do
    let(:user) { create(:user) }
    let!(:visit) { create(:visit, name: 'Paris', address: 'paris', user: user) }

    it "should not allow duplicate names per user" do
      visit2 = build(:visit, name: 'Paris', address: 'paris', user: user)
      expect(visit2).not_to be_valid
    end
  end

  describe "Geocoder" do
    let(:visit) { create(:visit) }

    it "should save coordinates" do
      expect(visit.latitude).not_to be_nil
      expect(visit.longitude).not_to be_nil
    end
  end
end
