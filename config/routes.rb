Rails.application.routes.draw do
  root 'films#index'
  resources :films, only: [:index, :show] do
    resources :ratings, only: [:new, :create]
    resources :comments, only: [:index, :new, :create, :destroy]
    resources :reviews, only: [:index, :new, :create] do
      resources :comments, only: [:index, :new, :create, :delete]
      resources :ratings, only: [:new, :create]
    end
  end
  delete 'comments', to: 'comments#destroy'

  resources :categories, only: [:index] do
    resources :reviews, only: [:index]
  end

  resources :reviews, only: [:index]

  resources :users, only: [:create, :new]
  resources :sessions, only: [:new, :create, :delete]
  delete 'sessions', to: 'sessions#destroy'

end
