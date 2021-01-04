class HobbyImagesController < ApplicationController

  def new
    @image = HobbyImage.new
  end

  def create
    @image = HobbyImage.new(hobby_image_params)
    @image.user_id = current_user.id
    @image.save
    redirect_to hobby_images_path
  end

  def index
    @images = HobbyImage.all
  end

  def show
    @image = HobbyImage.find(params[:id])
  end

  def destroy
  end

  private

  def hobby_image_params
    params.require(:hobby_image).permit(:image, :body, :user_id)
  end


end
