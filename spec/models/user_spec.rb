require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do

    context 'ユーザーのbodyが51文字以上の場合' do
      it 'ユーザーが保存できない' do
        expect(FactoryBot.build(:user,:body_over)).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Hobby_imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:hobby_images).macro).to eq :has_many
      end
    end
  end
end

