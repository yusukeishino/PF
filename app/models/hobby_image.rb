class HobbyImage < ApplicationRecord

  belongs_to :user
  attachment :image
end
