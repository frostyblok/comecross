require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:visit) }
  it { should validate_presence_of(:text) }
end
