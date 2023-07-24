require 'rails_helper'

RSpec.describe VisitsCategory, type: :model do
  it { should belong_to(:visit) }
  it { should belong_to(:category) }
end
