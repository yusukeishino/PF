Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :users
  resources :hobby_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :image_comments, only: [:create, :destroy]
  end

  # フォロー/フォロワーのルーティング
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
