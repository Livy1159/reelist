class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @comments = @film.comments.where.not(id: nil)
  end
end
