class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hobby_images, dependent: :destroy
  has_many :image_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :user_image

  validates :name, presence: true, length: {maximum: 20}
  validates :body, length: {maximum: 50}
  validates :email, uniqueness: true


  # フォロー/フォロワー
 has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :following_user, through: :follower, source: :followed
 has_many :follower_user, through: :followed, source: :follower

 # ユーザーをフォローする
 def follow(user_id)
  follower.create(followed_id: user_id)
 end

 # ユーザーのフォローを外す
 def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
 end

 # フォロー確認をおこなう
 def following?(user)
  following_user.include?(user)
 end

 #以下、メソッド化の例
 def follower_count
  follower.count
 end

 def followed_count
  followed.count
 end

 def current_user?(current_user)
  id == current_user.id
 end

 #ゲストログイン
 def self.guest
    find_or_create_by!(name:"ゲスト", email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
 end

end
