class ReviewsController < ApplicationController
  def index
    if params[:film_id]
      @film = Film.find(params[:film_id])
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

  def show
  end
end
