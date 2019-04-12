Rails.application.routes.draw do
  

  resources :descents
  resources :descent_clients
  resources :enable_people
  devise_for :users
  resources :boats
  resources :reservations
  resources :boxes
  resources :clients
  

  get 'welcome/index'
  root 'welcome#index'

  resources :users
  get 'cliente/:id', to: 'descent_clients#show_cliente'
  get 'cliente/:client_id/enable_person/:id', to: 'descent_clients#show_enable_person'
  get 'cliente/:client_id/boat/:id', to: 'descent_clients#show_boat'
  get '/nuevo_cliente/:id', to: 'clients#show_user'
  get '/report/index'
  get '/estadisticas_bajadas' => 'report#estadisticas_bajadas'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
