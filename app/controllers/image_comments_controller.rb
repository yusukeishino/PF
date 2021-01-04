class ImageCommentsController < ApplicationController

  def create
   hobby_image = HobbyImage.find(params[:hobby_image_id])
   comment = current_user.image_comments.new(image_comment_params)
   comment.hobby_image_id = hobby_image.id
   comment.save
   redirect_to hobby_image_path(hobby_image)
  end

  def destroy
   ImageComment.find_by(id: params[:id], hobby_image_id: params[:hobby_image_id]).destroy
   redirect_to hobby_image_path(params[:hobby_image_id])
  end

  private

  def image_comment_params
    params.require(:image_comment).permit(:comment)
  end

end
