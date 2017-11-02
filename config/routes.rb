Rails.application.routes.draw do
  root 'films#index'
  resources :films, only: [:index, :show] do
    resources :reviews, only: [:index, :show] do
      resources :comments, only: [:index]
    end
  end
  resources :users, only: [:create, :new]

  resources :sessions, only: [:new, :create]
  delete 'sessions', to: 'sessions#destroy'

end
