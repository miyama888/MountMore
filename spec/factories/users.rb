FactoryBot.define do
  factory :user do
    first_name { Faker::Lorem.characters(number: 3) }
    last_name { Faker::Lorem.characters(number: 3) }
    user_name { Faker::Lorem.characters(number: 3) }
    email                 { "kkk@gmail.com" }

    password              { "0000000" }
    password_confirmation { "0000000" }
  end
end
