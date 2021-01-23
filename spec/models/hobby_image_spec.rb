require 'rails_helper'

RSpec.describe 'Hobby_imageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do

    #let!(:hobby_image) do
     # Image.create({id:15,hobby_image_id:1,hobby_id:"e40ca42c10e1112978deb2ce502edfb8463fa81f48b2aa21c0aa8823527c"})
    #end

    context 'bodyカラムが600文字を超える場合' do
      it '保存されない' do
        expect(FactoryBot.build(:hobby_image)).to be_invalid
      end
    end
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
