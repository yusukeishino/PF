require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    #subject { user.valid? }

    #let!(:user) do
     # User.create({id:1,email:'test@gmail.com',name:'test',body:'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'})
    #end

    context 'ユーザーのbodyが51文字以上の場合' do
      it 'ユーザーが保存できない' do
        expect(FactoryBot.build(:user)).to be_invalid
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

