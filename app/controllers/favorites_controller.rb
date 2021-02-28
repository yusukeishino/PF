class FavoritesController < ApplicationController
  def create
    @image = HobbyImage.find(params[:hobby_image_id])
    favorite = current_user.favorites.new(hobby_image_id: @image.id)
    favorite.save
  end

  def destroy
    @image = HobbyImage.find(params[:hobby_image_id])
    favorite = current_user.favorites.find_by(hobby_image_id: @image.id)
    favorite.destroy
  end
end
