require 'rails_helper'

RSpec.describe VisitsCategoriesRating, type: :model do
  it { should belong_to(:visits_category) }
  it { should belong_to(:rating) }
end
