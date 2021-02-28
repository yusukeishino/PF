require 'rails_helper'

RSpec.describe 'Imageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context '画像が1枚の場合' do
      it '投稿成功' do
        expect(FactoryBot.build(:image)).to be_valid
      end
    end
  end

  # describe 'アソシエーションのテスト' do
  #   context 'Hobby_imageモデルとの関係' do
  #     it '1:Nとなっている' do
  #       expect(User.reflect_on_association(:hobby_images).macro).to eq :has_many
  #     end
  #   end
  # end
end
