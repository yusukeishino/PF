FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6) }
    body { Faker::Lorem.characters(number: 50) }
    trait :body_over do
      body { Faker::Lorem.characters(number: 51) }
    end
  end
end
