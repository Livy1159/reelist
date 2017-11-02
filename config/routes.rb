Rails.application.routes.draw do
  root 'films#index'
  resources :films, only: [:index, :show] do
    resources :reviews, only: [:index]
    resources :comments, only: [:index, :new, :create, :delete]
    resources :ratings, only: [:new, :create]
  end
  resources :users, only: [:create, :new]
  resources :sessions, only: [:new, :create, :delete]


end
