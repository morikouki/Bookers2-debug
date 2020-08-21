Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
end