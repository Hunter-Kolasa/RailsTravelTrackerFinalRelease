class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      # what to do if it's valid
      redirect_to movies_path
    else
      # what to do if it's not valid
      flash.now[:error] = @movie.errors.full_messages
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      flash.now[:error] = @movie.errors.full_messages
      render :edit
    end
  end

  def destroy
    @movie.destroy
    flash[:notice] = "#{@movie.title} was deleted."
    redirect_to movies_path
  end
  
  private

    def find_movie
      @movie = Movie.find_by_id(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :genre, :release_date)
    end
end
