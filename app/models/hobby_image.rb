class HobbyImage < ApplicationRecord
  #元々ある画像用モデル

  belongs_to :user
  has_many :image_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :hobby
  #attachment :image

  validates :images, presence: true


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
