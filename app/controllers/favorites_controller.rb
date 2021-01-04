class FavoritesController < ApplicationController

  def create
   hobby_image = HobbyImage.find(params[:hobby_image_id])
   favorite = current_user.favorites.new(hobby_image_id: hobby_image.id)
   favorite.save
   redirect_to hobby_image_path(hobby_image)
  end

  def destroy
   hobby_image = HobbyImage.find(params[:hobby_image_id])
   favorite = current_user.favorites.find_by(hobby_image_id: hobby_image.id)
   favorite.destroy
   redirect_to hobby_image_path(hobby_image)
  end

end
