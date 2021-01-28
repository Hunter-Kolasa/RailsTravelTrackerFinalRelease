Rails.application.routes.draw do
  root(to: "static#home")

  # Restful Routes for Movies
  resources :movies do
    resources :reviews
  end 
  #/movies/:movie_id/reviews/:id

  resources :users, only: [:new,:create]


  
  get "/logout", to: "sessions#logout", as: "logout"
  get "/signup", to: "sessions#signup", as: "signup"
  post "/signup", to: "sessions#create"
  

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
  # get("/movies", to: "movies#index", as: "movies_index") # index
  # get "/movies/new" # new
  # get "/movies/:id" # show
  # get "/movies/:id/edit" # edit
  # post "/movies" # create
  # patch "/movies/:id" # update
  # delete "/movies/:id" # destroy

end
