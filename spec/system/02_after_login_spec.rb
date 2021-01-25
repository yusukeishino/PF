require 'rails_helper'

RSpec.describe 'Users', type: :system do

  describe 'ログイン後のテスト' do
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
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'ログイン'
        click_link 'マイページ'
        visit user_path(@user.id)
        #@delete = create(:hobby_image)
      end

      #subject { delete :hobby_image_destroy, id: @hobby_image_delete }

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
        expect(current_path).to eq edit_user_path(@user.id)
      end
      it '投稿を押すと、hobby_image/showへ遷移する' do
         hobby_image = FactoryBot.create(:hobby_image)
         visit hobby_image_path(1)
         expect(current_path).to eq hobby_image_path(1)
      end
      it '正しく削除される' do
         #click_link '削除'
         hobby_image = FactoryBot.create(:hobby_image)
         expect{ hobby_image.destroy }.to change{ HobbyImage.count }.by(-1)
         #expect{ subject }.to change{ HobbyImage.count }.by(-1)
         expect(current_path).to eq user_path(@user.id)
       end
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




#   describe '投稿一覧画面のテスト' do
#     before do
#       visit books_path
#     end

#     context '表示内容の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/books'
#       end
#       it '自分と他人の画像のリンク先が正しい' do
#         expect(page).to have_link '', href: user_path(book.user)
#         expect(page).to have_link '', href: user_path(other_book.user)
#       end
#       it '自分の投稿と他人の投稿のタイトルのリンク先がそれぞれ正しい' do
#         expect(page).to have_link book.title, href: book_path(book)
#         expect(page).to have_link other_book.title, href: book_path(other_book)
#       end
#       it '自分の投稿と他人の投稿のオピニオンが表示される' do
#         expect(page).to have_content book.body
#         expect(page).to have_content other_book.body
#       end
#     end

#







#     context '削除リンクのテスト' do
#       before do
#         click_link 'Destroy'
#       end

#       it '正しく削除される' do
#         expect(Book.where(id: book.id).count).to eq 0
#       end
#       it 'リダイレクト先が、投稿一覧画面になっている' do
#         expect(current_path).to eq '/books'
#       end
#     end
#   end

#   describe '自分の投稿編集画面のテスト' do
#     before do
#       visit edit_book_path(book)
#     end

#     context '表示の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/books/' + book.id.to_s + '/edit'
#       end
#       it '「Editing Book」と表示される' do
#         expect(page).to have_content 'Editing Book'
#       end
#       it 'title編集フォームが表示される' do
#         expect(page).to have_field 'book[title]', with: book.title
#       end
#       it 'opinion編集フォームが表示される' do
#         expect(page).to have_field 'book[body]', with: book.body
#       end
#       it 'Update Bookボタンが表示される' do
#         expect(page).to have_button 'Update Book'
#       end
#       it 'Showリンクが表示される' do
#         expect(page).to have_link 'Show', href: book_path(book)
#       end
#       it 'Backリンクが表示される' do
#         expect(page).to have_link 'Back', href: books_path
#       end
#     end

#     context '編集成功のテスト' do
#       before do
#         @book_old_title = book.title
#         @book_old_body = book.body
#         fill_in 'book[title]', with: Faker::Lorem.characters(number: 4)
#         fill_in 'book[body]', with: Faker::Lorem.characters(number: 19)
#         click_button 'Update Book'
#       end

#       it 'titleが正しく更新される' do
#         expect(book.reload.title).not_to eq @book_old_title
#       end
#       it 'bodyが正しく更新される' do
#         expect(book.reload.body).not_to eq @book_old_body
#       end
#       it 'リダイレクト先が、更新した投稿の詳細画面になっている' do
#         expect(current_path).to eq '/books/' + book.id.to_s
#         expect(page).to have_content 'Book detail'
#       end
#     end
#   end

#   describe 'ユーザ一覧画面のテスト' do
#     before do
#       visit users_path
#     end

#     context '表示内容の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/users'
#       end
#       it '自分と他人の画像が表示される: fallbackの画像がサイドバーの1つ＋一覧(2人)の2つの計3つ存在する' do
#         expect(all('img').size).to eq(3)
#       end
#       it '自分と他人の名前がそれぞれ表示される' do
#         expect(page).to have_content user.name
#         expect(page).to have_content other_user.name
#       end
#       it '自分と他人のshowリンクがそれぞれ表示される' do
#         expect(page).to have_link 'Show', href: user_path(user)
#         expect(page).to have_link 'Show', href: user_path(other_user)
#       end
#     end

#     context 'サイドバーの確認' do
#       it '自分の名前と紹介文が表示される' do
#         expect(page).to have_content user.name
#         expect(page).to have_content user.introduction
#       end
#       it '自分のユーザ編集画面へのリンクが存在する' do
#         expect(page).to have_link '', href: edit_user_path(user)
#       end
#       it '「New book」と表示される' do
#         expect(page).to have_content 'New book'
#       end
#       it 'titleフォームが表示される' do
#         expect(page).to have_field 'book[title]'
#       end
#       it 'titleフォームに値が入っていない' do
#         expect(find_field('book[title]').text).to be_blank
#       end
#       it 'opinionフォームが表示される' do
#         expect(page).to have_field 'book[body]'
#       end
#       it 'opinionフォームに値が入っていない' do
#         expect(find_field('book[body]').text).to be_blank
#       end
#       it 'Create Bookボタンが表示される' do
#         expect(page).to have_button 'Create Book'
#       end
#     end
#   end

#   describe '自分のユーザ詳細画面のテスト' do
#     before do
#       visit user_path(user)
#     end

#     context '表示の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/users/' + user.id.to_s
#       end
#       it '投稿一覧のユーザ画像のリンク先が正しい' do
#         expect(page).to have_link '', href: user_path(user)
#       end
#       it '投稿一覧に自分の投稿のtitleが表示され、リンクが正しい' do
#         expect(page).to have_link book.title, href: book_path(book)
#       end
#       it '投稿一覧に自分の投稿のopinionが表示される' do
#         expect(page).to have_content book.body
#       end
#       it '他人の投稿は表示されない' do
#         expect(page).not_to have_link '', href: user_path(other_user)
#         expect(page).not_to have_content other_book.title
#         expect(page).not_to have_content other_book.body
#       end
#     end

#     context 'サイドバーの確認' do
#       it '自分の名前と紹介文が表示される' do
#         expect(page).to have_content user.name
#         expect(page).to have_content user.introduction
#       end
#       it '自分のユーザ編集画面へのリンクが存在する' do
#         expect(page).to have_link '', href: edit_user_path(user)
#       end
#       it '「New book」と表示される' do
#         expect(page).to have_content 'New book'
#       end
#       it 'titleフォームが表示される' do
#         expect(page).to have_field 'book[title]'
#       end
#       it 'titleフォームに値が入っていない' do
#         expect(find_field('book[title]').text).to be_blank
#       end
#       it 'opinionフォームが表示される' do
#         expect(page).to have_field 'book[body]'
#       end
#       it 'opinionフォームに値が入っていない' do
#         expect(find_field('book[body]').text).to be_blank
#       end
#       it 'Create Bookボタンが表示される' do
#         expect(page).to have_button 'Create Book'
#       end
#     end
#   end

#   describe '自分のユーザ情報編集画面のテスト' do
#     before do
#       visit edit_user_path(user)
#     end

#     context '表示の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
#       end
#       it '名前編集フォームに自分の名前が表示される' do
#         expect(page).to have_field 'user[name]', with: user.name
#       end
#       it '画像編集フォームが表示される' do
#         expect(page).to have_field 'user[profile_image]'
#       end
#       it '自己紹介編集フォームに自分の自己紹介文が表示される' do
#         expect(page).to have_field 'user[introduction]', with: user.introduction
#       end
#       it 'Update Userボタンが表示される' do
#         expect(page).to have_button 'Update User'
#       end
#     end

#     context '更新成功のテスト' do
#       before do
#         @user_old_name = user.name
#         @user_old_intrpduction = user.introduction
#         fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
#         fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
#         click_button 'Update User'
#       end

#       it 'nameが正しく更新される' do
#         expect(user.reload.name).not_to eq @user_old_name
#       end
#       it 'introductionが正しく更新される' do
#         expect(user.reload.introduction).not_to eq @user_old_intrpduction
#       end
#       it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
#         expect(current_path).to eq '/users/' + user.id.to_s
#       end
#     end
#   end
# end

