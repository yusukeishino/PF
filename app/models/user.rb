class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hobby_images, dependent: :destroy
  has_many :image_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :user_image

  validates :name, presence: true

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

 #以下2つ、メソッド化の例
 def follower_count
  follower.count
 end

 def current_user?(current_user)
  id == current_user.id
 end

end
