class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @images = @user.hobby_images
  end

end
