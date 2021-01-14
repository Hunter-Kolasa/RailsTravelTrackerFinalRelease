Rails.application.routes.draw do
  
  root(to: "static#home")

  # Restful Routes for Movies
  resources :movies
  # get("/movies", to: "movies#index", as: "movies_index") # index
  # get "/movies/new" # new
  # get "/movies/:id" # show
  # get "/movies/:id/edit" # edit
  # post "/movies" # create
  # patch "/movies/:id" # update
  # delete "/movies/:id" # destroy

end
