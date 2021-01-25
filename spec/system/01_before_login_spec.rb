require 'rails_helper'

RSpec.describe 'Users', type: :system do

   describe 'ログイン前のテスト' do
     before do
       visit root_path
    end
    context 'ヘッダーのテスト' do
       it 'Hobby Graph!!を押すと、root_pathに遷移する' do
         click_link 'Hobby Graph!!'
         expect(current_path).to eq root_path
       end
      it '投稿一覧を押すと、投稿一覧に遷移する' do
         click_link '投稿一覧'
         expect(current_path).to eq hobby_images_path
      end
      it 'Newsを押すと、Newsに遷移する' do
         click_link 'News'
         expect(current_path).to eq news_path
      end
      it 'ユーザー登録を押すと、ユーザー登録に遷移する' do
         click_link 'ユーザー登録'
         expect(current_path).to eq new_user_registration_path
      end
      it 'ログインを押すと、ログインに遷移する' do
         click_link 'ログイン'
         expect(current_path).to eq new_user_session_path
      end
      it 'ゲストログインを押すと、ゲストログインに遷移する' do
        click_link 'ゲストログイン'
        expect(current_path).to eq hobby_images_path
      end
     end

     context '投稿一覧画面でのテスト' do
       before do
         user = FactoryBot.create(:hobby_image)
         visit hobby_images_path
       end
       it "ユーザー名を押すと、ログイン画面に遷移する" do
         visit user_path(1)
         expect(current_path).to eq new_user_session_path
       end
       it "投稿画像を押すと、ログイン画面に遷移する" do
         visit hobby_image_path(1)
         expect(current_path).to eq new_user_session_path
       end
     end
   end

  describe 'ユーザー登録のテスト' do
    context 'ユーザー登録成功のテスト' do
      before do
        visit new_user_registration_path
        fill_in 'user_name', with: Faker::Lorem.characters(number: 10)
        fill_in 'user_email', with: Faker::Internet.email
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button '登録'
      end
      it 'ユーザー登録成功後の遷移先が投稿一覧になっている' do
        expect(current_path).to eq hobby_images_path
      end
    end

    context 'ユーザー登録失敗のテスト' do
      before do
        visit new_user_registration_path
        fill_in 'user_name', with: ''
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
        fill_in 'user_password_confirmation', with: ''
        click_button '登録'
      end
      it 'ユーザー登録失敗後の遷移先がユーザー登録画面になっている' do
        expect(current_path).to eq '/users'
      end
    end
  end

  describe 'ログインのテスト' do
    context 'ログイン成功のテスト' do
      before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'ログイン'
      end
      it 'ログイン後の遷移先が投稿一覧になっている' do
        expect(current_path).to eq hobby_images_path
      end
    end

    context 'ログイン失敗のテスト'
      before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: ''
        fill_in 'Password', with: ''
        click_button 'ログイン'
      end
      it 'ログイン失敗後の遷移先がログイン画面になっている' do
        expect(current_path).to eq new_user_session_path
      end
  end
end

