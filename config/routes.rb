Rails.application.routes.draw do

  resources :users
  get 'home/index'
  get 'main/index'
  get 'cookie/new'
  post 'cookie/sign_in', to: 'cookie#create'
  resources :members
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end