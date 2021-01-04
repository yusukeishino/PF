Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :users
  resources :hobby_images, only: [:new, :create, :index, :show, :destroy] do
    resources :image_comments, only: [:create, :destroy]
  end

end
