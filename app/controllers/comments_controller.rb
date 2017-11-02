class CommentsController < ApplicationController
  def index
    @film = Film.find_by(params[:id])
    @comments = @film.comments
  end

  def new
    @film = Film.find_by(params[:id])
  end

  def create
    @film = Film.find_by(params[:id])
    @comment = @film.comments.new(comment_params)
    @comment.user = @current_user
    if @comment.save
      redirect_to film_path(@film)
    else
      render :'films/show'
    end
  end

  def destroy
    @film = Film.find_by(params[:id])
    @comment = @film.comments.find(params[:id])
    @comment.destroy
    redirect_to film_path(@film)
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
