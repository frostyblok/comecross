require 'rails_helper'

RSpec.describe CategoryRating, type: :model do
  it { should belong_to(:rating) }
  it { should belong_to(:category) }
end
