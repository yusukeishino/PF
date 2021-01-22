require 'rails_helper'

RSpec.describe User, type: :model do
 context '会員登録のテスト' do
  it "名前とメールアドレスとパスワードがあれば登録できる" do
    user = User.new(
     name: "testman",
     email: "testman@example.com",
     password: "password",
     )
     # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
     expect(user).to be_valid

  end

  it "名前がなければ登録できない" do
   user = User.new(
    name: nil,
     email: "testman@example.com",
     password: "password",
     )
     # valid?メソッドを呼び出すとエラー検証が行えます。次行のerrorsメソッドを使うために必要です。
　　　user.valid?
     # valid?メソッドでfalseであれば、user.errosでどんなerrorを持っているか返してくれます。今回は特に[:first_name]のエラーがみたいのでexpect()内部で指定してあげます。
　　　# 今回は"can't be blank"というエラーを含んでいる(include)しているはずという記述になります。複数含む場合ももちろんあります。
     expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "メールアドレスがなければ登録できない" do
      user = User.new(
     name: "testman",
     email: nil,
     password: "password",
     )
     # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
     expect(user).to be_valid
  end

  it "メールアドレスが重複していたら登録できない"

  it "パスワードがなければ登録できない"

  it "パスワードが暗号化されているか"
 end

end