class HobbyImagesController < ApplicationController

  def new
    @image = HobbyImage.new
  end

  def create
    @image = HobbyImage.new(hobby_image_params)
    @image.user_id = current_user.id
    if @image.save
     redirect_to hobby_images_path
    else
     @image = HobbyImage.new
     render :new
    end
  end

  def index
    @images = HobbyImage.all
  end

  def show
    @image = HobbyImage.find(params[:id])
    @image_comment = ImageComment.new
  end

  def destroy
    @image = HobbyImage.find(params[:id])
    @image.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def hobby_image_params
    params.require(:hobby_image).permit(:image, :body, :user_id)
  end


end
