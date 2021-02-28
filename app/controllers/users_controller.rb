class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hobby_images = @user.hobby_images.reverse_order
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following_user
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_image, :name, :body)
  end
end
