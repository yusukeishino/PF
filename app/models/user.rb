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

end
