require 'rails_helper'

RSpec.describe 'Users', type: :system do

  describe 'ログイン前のテスト' do
     before do
       visit root_path
    end
    context 'ヘッダーのテスト' do
      before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'ログイン'
      end
       it 'Hobby Graph!!を押すと、root_pathに遷移する' do
         click_link 'Hobby Graph!!'
         expect(current_path).to eq root_path
       end
      it 'マイページを押すと、ユーザー詳細に遷移する' do
         click_link 'マイページ'
         expect(current_path).to eq user_path(3)
      end
      it '新規投稿を押すと、hobby_image/newに遷移する' do
         click_link '新規投稿'
         expect(current_path).to eq new_hobby_image_path
      end
      it '投稿一覧を押すと、投稿一覧に遷移する' do
         click_link '投稿一覧'
         expect(current_path).to eq hobby_images_path
      end
      it 'Newsを押すと、Newsに遷移する' do
         click_link 'News'
         expect(current_path).to eq news_path
      end
      it 'お問い合わせを押すと、inquirysに遷移する' do
         click_link 'お問い合わせ'
         expect(current_path).to eq new_inquiry_path
      end
      it 'お問い合わせを押すと、inquirysに遷移する' do
         click_link 'お問い合わせ'
         expect(current_path).to eq new_inquiry_path
      end
      it 'ログアウトを押すと、topに遷移する' do
         click_link 'ログアウト'
         expect(current_path).to eq root_path
      end
     end

     context 'マイページのテスト' do
       before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'ログイン'
        click_link 'マイページ'
        visit user_path(3)
      end
      it 'フォロー数を押すと、フォロー画面へ遷移する' do
        click_link 'フォロー数:0'
        redirect_params = Rack::Utils.parse_query(URI.parse(current_path).query)
        expect(current_path).to eq following_path
      end
      it 'フォロワー数を押すと、フォロワー画面へ遷移する' do
        click_link 'フォロワー数:0'
        redirect_params = Rack::Utils.parse_query(URI.parse(current_path).query)
        expect(current_path).to eq followed_path
      end
      it 'プロフィール編集を押すと、user/editへ遷移する' do
        click_link 'プロフィール編集'
        expect(current_path).to eq edit_user_path(3)
      end
      it '投稿を押すと、hobby_image/showへ遷移する' do
         user = FactoryBot.create(:hobby_image)
         visit hobby_image_path(1)
         expect(current_path).to eq hobby_image_path(1)
      end
     end

     context'user編集のテスト' do
       before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'ログイン'
        click_link 'マイページ'
        click_link 'プロフィール編集'
        visit edit_user_path(3)
     end
     it 'ユーザーを編集する' do
       #attach_file 'user_user_image', "#{Rails.root}/app/assets/images/no_image.jpg"
       #attach_file 'user_user_image', with: Rack::Test::UploadedFile.new('#{Rails.root}/app/assets/images/no_image.jpg', 'image/jpeg')
       attach_file 'user_user_image', "#{Rails.root}/app/assets/images/no_image.jpg"
       fill_in 'inputName', with: Faker::Lorem.characters(number:5)
       fill_in 'inputBody', with: Faker::Lorem.characters(number:50)
       click_button '変更を保存'
       expect(current_path).to eq user_path(3)
     end
   end

     context '投稿一覧画面でのテスト' do
       before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'ログイン'
        click_link '投稿一覧'
        visit hobby_images_path
      end
       it "ユーザー名を押すと、user/showに遷移する" do
         visit user_path(3)
         expect(current_path).to eq user_path(3)
       end
       it "投稿画像を押すと、hobby_image/showに遷移する" do
         user = FactoryBot.create(:hobby_image)
         visit hobby_image_path(1)
         expect(current_path).to eq hobby_image_path(1)
       end
     end

     context 'お問い合わせのテスト' do
       before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'ログイン'
        click_link 'お問い合わせ'
        visit new_inquiry_path
      end
      it 'お問い合わせメールを送信する' do
        fill_in 'inquiry_address', with: Faker::Internet.email
        fill_in 'inquiry_name',with: Faker::Lorem.characters(number: 10)
        fill_in 'inquiry_message',with: Faker::Lorem.characters(number:50)
        click_button '送信'
        expect(current_path).to eq confirm_path
      end
     end
   end
end

