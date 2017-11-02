class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
  end
end
