Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'homes#top'
  get 'news' => 'homes#news'
  get 'following' => 'users#following'
  get 'followed' => 'users#followed'
  get 'confirm' => 'inquirys#confirm'
  get 'search/search'

  resources :users
  resources :hobby_images, only: %i[new create index show destroy] do
    resource :favorites, only: %i[create destroy]
    resources :image_comments, only: %i[create destroy]
  end
  resources :inquirys, only: %i[new create]

  # フォロー/フォロワーのルーティング
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end
