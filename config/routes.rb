Rails.application.routes.draw do
  root to: 'movies#index'
  devise_for :users

  resources :movies do
    resources :reviews
    # resources :casts, only: [:new, :create, :show] 
    resources :star_casts 
  end
  resources :casts

  
  
end
