class HobbyImage < ApplicationRecord

  belongs_to :user
  has_many :image_comments, dependent: :destroy
  
  attachment :image
end
