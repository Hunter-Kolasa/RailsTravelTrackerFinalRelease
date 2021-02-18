Rails.application.routes.draw do
  # Oauth
    match '/auth/:provider/callback', to: 'sessions#google', via: [:get, :post]
  # Standard signup/login
    get '/signup' => 'users#new', as: 'signup'
    post '/signup' => 'users#create'
    get '/login' => 'sessions#new', as: 'login'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy', as: 'logout'
    resources :users, only: [:new, :create], path_names: {new: 'signup'}
  #route for new destinations separate of vacations
    post '/destinations/new' => 'destinations#create'
  #nest routes for users' vacations
    resources :users do
      resources :vacations
    end
  #**allow access to all routes for vacatiosn and destinations (**streamline)
    resources :destinations
    resources :vacations, only: [:new, :show]
  #specifiy root page '/'
    root 'destinations#index'
end
