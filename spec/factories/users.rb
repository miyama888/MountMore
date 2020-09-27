FactoryBot.define do
  factory :user do
    first_name { Faker::Lorem.characters(number: 3) }
    last_name { Faker::Lorem.characters(number: 3) }
    first_kana { "ナタネ" }
    last_kana { "サラダ" }
    user_name { Faker::Lorem.characters(number: 3) }
    post_number { "2227777" }
    address { Faker::Address.state }
    email { Faker::Internet.email }
    password              { "0000000" }
    password_confirmation { "0000000" }
  end
end
