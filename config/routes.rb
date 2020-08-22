Rails.application.routes.draw do

  resources :users
  get 'home/index'
  get 'main/index'
  get 'cookie/new'
  post 'cookie/sign_in', to: 'cookie#create'
  delete 'cookie/sign_out', to: 'cookie#destroy'
  get 'sessions/sign_in', to: 'sessions#new'
  post 'sessions/sign_in', to: 'sessions#create'
  delete 'sessions/sign_out', to: 'sessions#destroy'
  get 'auth/sign_in'
  post 'auth/verify'
  delete 'auth/sign_out'
  resources :members
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end