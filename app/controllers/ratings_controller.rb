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
    if request.fullpath.include?("/films")
      @rateable = Film.find_by(params[:id])
    else
      @rateable = Review.find_by(params[:id])
    end
    @film = @rateable
    @rating = @rateable.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to @rateable
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
