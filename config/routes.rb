Rails.application.routes.draw do
  
  match '/auth/:provider/callback', to: 'sessions#google', via: [:get, :post] 
  get '/signup' => 'users#new', as: 'signup'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create], path_names: {new: 'signup'}

  resources :users do
    resources :vacations
  end
  
  post '/destinations/new' => 'destinations#create'
  resources :vacations
  resources :destinations
  root 'destinations#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
