Rails.application.routes.draw do
  root 'films#index'
  resources :films, only: [:index, :show]
  resources :users, only: [:create, :new]
end
