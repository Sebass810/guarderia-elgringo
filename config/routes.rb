Rails.application.routes.draw do
  
  devise_for :users
  resources :boats
  resources :reservations
  resources :boxes
  resources :enabled_clients
  resources :clients
  resources :enable_people
  

  get 'welcome/index'
  root 'welcome#index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
