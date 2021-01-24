require 'rails_helper'

RSpec.describe 'Hobby_imageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do



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
