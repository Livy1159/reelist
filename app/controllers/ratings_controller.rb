class RatingsController < ApplicationController
  include SessionsHelper

  def index
    @film = Film.find_by(params[:id])
    @ratings = @film.ratings
  end

  def new
    @film = Film.find_by(params[:id])
  end

  def create
    if request.fullpath.include?("/reviews")
      @rateable = Review.find_by(params[:id])
    else
      @rateable = Film.find_by(params[:id])
    end
    @film = Film.find_by(params[:id])
    @rating = @rateable.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      if @rateable.class == Review
        redirect_to film_reviews_path(@film)
      else
        redirect_to film_path(@film)
      end

    else
      render :'films/show'
    end
  end

  def destroy
    @rating = Comment.find(params[:id])
    @rating.destroy
    redirect_to film_path(@film)
  end

  private
  def rating_params
    params.require(:rating).permit(:user, :value, :rateable_id, :rateable_type)
  end
end
