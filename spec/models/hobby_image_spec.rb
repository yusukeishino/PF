require 'rails_helper'

RSpec.describe 'Hobby_imageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    
    #let!(:hobby_image) do
     # Image.create({id:15,hobby_image_id:1,hobby_id:"e40ca42c10e1112978deb2ce502edfb8463fa81f48b2aa21c0aa8823527c"})
    #end

    #let!(:hobby_image_body) do
     # HobbyImage.create({id: 1,image_id: 1,body:"えええええええええええ",user_id: 1})
    #end

    context 'hobby_idカラムが空欄の場合' do
      it '保存されない' do
        expect(hobby_image).to be_invalid
      end
    end

    context 'bodyカラムが600文字を超える場合' do
      it '保存されない' do
        expect(hobby_image_body).to be_invalid
      end
    end

    #context 'bodyカラム' do
     # it '1000文字以下であること: 1000文字は〇' do
      #  hobby_image.body = Faker::Lorem.characters(number: 1000)
       # is_expected.to eq true
      #end
      #it '1000文字以下であること: 51文字は×' do
       # hobby_image.body = Faker::Lorem.characters(number: 1001)
      #  is_expected.to eq false
      #end
    #end
  end

  describe 'アソシエーションのテスト' do
    context 'HobbyImageモデルが' do
      it 'N:1となっている' do
        expect(HobbyImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

#user = ["A", "B", "C"]
#taro = {name:'Taro', age:22, height:175}
