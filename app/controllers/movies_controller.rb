class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
  end
  
  private
    def find_movie
      @movie = Movie.find_by_id(params[:id])
    end
end
