class CosController < ApplicationController
  def index
    @film = Film.find_by(params[:id])
    @reviews = @film.reviews
  end

  def new
  end

  def show
  end
end
