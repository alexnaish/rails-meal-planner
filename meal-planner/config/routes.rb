Rails.application.routes.draw do
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile', to: 'users#profile', as: 'profile'

  resources :users
  resources :sessions
  resources :recipes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
