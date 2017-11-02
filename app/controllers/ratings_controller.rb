class ReviewsController < ApplicationController
  def new
  end

  def create
    @film = Film.find_by(params[:id])
    @rating = @film.ratings.new(rating_params)
    @rating.user = @current_user
    if @rating.save
      redirect_to film_path(@film)
    else
      render :'films/show'
    end
  end
  private
  def rating_params
    params.require(:rating).permit(:user, :value)
  end
end
