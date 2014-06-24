Rails.application.routes.draw do
  root to: "players#index"
  resources :users, only: [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'

  resources :players, only: [:index, :show]
  resources :bids, only: [:new, :create, :edit, :update, :destroy]
end
