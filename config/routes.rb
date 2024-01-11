Rails.application.routes.draw do
  root to: 'movies#index'
  devise_for :users

  resources :movies do
    resources :reviews
  end
end
