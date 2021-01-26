class ReviewsController < ApplicationController
  def index
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  # /movies/:movie_id/reviews/new 
  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build
    # Review.new(movie_id:@movie.id)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # /movies/:movie_id/reviews/:id
      redirect_to movie_review_path(params[:movie_id], @review)
    else 
      render :new 
    end 
  end

  def edit
    @review = Review.find(params[:id])
    @movie = Movie.find(params[:movie_id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to movie_path(@review.movie_id)
  end

  def destory
  end 

  private 
   def review_params
    params.require(:review).permit(:description,:user_id,:movie_id)
   end 
end
