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
    if request.fullpath.include?("/films")
      @commentable = Film.find_by(params[:id])
    else
      @commentable = Review.find_by(params[:id])
    end
    @film = @commentable


    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable
    else
      render :'films/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to film_path(@film)
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body, :commentable_id, :commentable_type)
  end
end
