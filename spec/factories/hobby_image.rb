FactoryBot.define do
  factory :hobby_image do
    body { Faker::Lorem.characters(number:600)}
  end
end