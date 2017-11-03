class CommentsController < ApplicationController
  include SessionsHelper

  def index
    @film = Film.find_by(params[:id])
    @comments = @film.comments
  end

  def new
    @film = Film.find_by(params[:id])
  end

  def create
    if request.fullpath.include?("/reviews")
      @commentable = Review.find_by(params[:id])
    else
      @commentable = Film.find_by(params[:id])
    end
    @film = Film.find_by(params[:id])
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      if @commentable.class == Review
        redirect_to film_reviews_path(@film)
      else
        redirect_to film_path(@film)
      end
    else
      render :'films/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to films_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body, :commentable_id, :commentable_type)
  end
end
