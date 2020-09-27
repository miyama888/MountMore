FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 30) }
    user
    prefecture
    area
  end
end
