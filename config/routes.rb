Rails.application.routes.draw do
  
  authenticated do
    root to: 'texts#index', as: :authenticated
  end
  
  root to: 'home#index'

  devise_for :users
  resources :users, only: [:update, :show]
  resources :texts
  resources :charges, only: [:new, :create]

end
