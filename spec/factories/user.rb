FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5)}
    email { Faker::Internt.email }
    body { Faker::Lorem.characters(number:51)}
    password { 'password' }
    password_confirm { 'password' }
  end
end