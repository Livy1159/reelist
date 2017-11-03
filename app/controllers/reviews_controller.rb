class ReviewsController < ApplicationController
  include SessionsHelper

  def index
    if params[:film_id]
      @film = Film.find(params[:film_id])
      @review = Review.new
      @reviews = @film.reviews
      render "reviews/index"
    elsif params[:category_id]
      @category = Category.find(params[:category_id])
      @reviews = @category.reviews
      render "categories/index"
    else
      @reviews = Review.all.limit(5)
      render "reviews/reviews"
    end
  end

  def new
  end

  def create
    @film = Film.find(params[:film_id])
    @review = Review.new(review_params)
    @review.film_id = @film.id

    current_user.reviews << @review
    if @review.save
      redirect_to film_reviews_path(@film)
    else
      redirect_to film_reviews_path(@film)
    end
  end

  def show
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
