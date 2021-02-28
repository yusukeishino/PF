class HobbyImagesController < ApplicationController
  def new
    @image = HobbyImage.new
  end

  def create
    @image = HobbyImage.new(hobby_image_params)
    @image.user_id = current_user.id
    if @image.save
      @image.images_hobbies.each do |i|
        if Vision.is_safe_image(i)
          pp true
        else
          flash[:notice] = '投稿画像がふさわしくない可能性があります。'
          pp false
          @image.destroy
          render :new and return
        end
      end
      redirect_to hobby_images_path
    else
      render :new
    end
  end

  def index
    @images = HobbyImage.all.reverse_order
    @all_ranks = HobbyImage.find(Favorite.group(:hobby_image_id).order('count(hobby_image_id) desc').limit(3).pluck(:hobby_image_id))
  end

  def show
    @hobby_image = HobbyImage.find_by(id: params[:id])
    @image_comment = ImageComment.new
  end

  def destroy
    @image = HobbyImage.find(params[:id])
    @image.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def hobby_image_params
    params.require(:hobby_image).permit(:body, :user_id, images_hobbies: [])
  end
end
