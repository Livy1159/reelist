class SessionsController < ApplicationController
  include SessionsHelper

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      login(@user)
      redirect_to films_path
    else
      @errors = ["Invalid username or password."]
      render :'users/new'
    end
  end

  def new
  end

  def logout
    session[:id] = nil
    redirect_to films_path
  end

  private
  def session_params
    params.permit(:username, :password)
  end
end
