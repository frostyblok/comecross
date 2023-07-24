require 'rails_helper'

RSpec.describe Visit, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:categories) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
