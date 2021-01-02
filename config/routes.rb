Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  resources :hobby_images
  resources :users
end
