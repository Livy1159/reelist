class CategoriesController < ApplicationController

  def index
    @category = Categories.find(params[:id])
    @reviews = @category.reviews
  end

end
