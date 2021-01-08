class ImageCommentsController < ApplicationController

  def create
   @image = HobbyImage.find(params[:hobby_image_id])
   @comment = current_user.image_comments.new(image_comment_params)
   @comment.hobby_image_id = @image.id
   @comment.save
  end

  def destroy
   @image = HobbyImage.find(params[:hobby_image_id])
   ImageComment.find_by(id: params[:id], hobby_image_id: params[:hobby_image_id]).destroy
  end

  private

  def image_comment_params
    params.require(:image_comment).permit(:comment)
  end

end
