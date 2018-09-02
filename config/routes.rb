Rails.application.routes.draw do
  get 'likes/index'

  get 'likes/create'

  get 'likes/destroy'

  root to: "blogs#index"
  # resources :sessions, only: [:new, :create, :destroy]
  get "/users/login", to: "sessions#new"
  post "/users/login", to: "sessions#create"
  delete "users/:id/logout", as: "users_delete", to: "sessions#destroy"
  resources :blogs
  resource :users, except: [:index]
  get "/mypage", to: "users#show"
  resources :likes, only: [:index, :create, :destroy]
end
