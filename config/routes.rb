Rails.application.routes.draw do
  root 'films#index'
  resources :films, only: [:index, :show] do
    resources :reviews, only: [:index]
  end
  resources :users, only: [:create, :new]

end
