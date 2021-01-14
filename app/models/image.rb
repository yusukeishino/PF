class Image < ApplicationRecord
  #画像複数投稿のために制作したモデル

  belongs_to :hobby_image
  attachment :hobby
end
