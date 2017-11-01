Rails.application.routes.draw do
  root 'films#index'
  resources :users, only: [:create, :new]
end
