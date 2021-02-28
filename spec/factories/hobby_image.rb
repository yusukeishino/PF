FactoryBot.define do
  factory :hobby_image do
    user { create(:user) }
    images { [create(:image), create(:image)] }
    body { Faker::Lorem.characters(number: 600) }
    trait :body_over do
      body { Faker::Lorem.characters(number: 601) }
    end
  end
end
