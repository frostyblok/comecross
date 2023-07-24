FactoryBot.define do
  factory :visit do
    name { Faker::Name.unique.name }
    address { 'Paris' }
    user
  end
end
