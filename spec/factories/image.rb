FactoryBot.define do
  factory :image do
    hobby { Rack::Test::UploadedFile.new('app/assets/images/no_image.jpg', 'image/jpeg') }
    hobby_image { HobbyImage.new }
  end
end
