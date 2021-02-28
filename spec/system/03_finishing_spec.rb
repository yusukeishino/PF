require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '他人のユーザ詳細画面のテスト' do
    before do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'ログイン'
      context '他人のユーザ情報編集画面' do
        it '遷移できず、自分のユーザ詳細画面にリダイレクトされる' do
          visit edit_user_path(other_user)
          expect(current_path).to eq '/users/' + user.id.to_s
        end
      end
    end
  end
end
