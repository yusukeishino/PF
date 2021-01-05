class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @images = @user.hobby_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:user_image, :name)
  end

end
