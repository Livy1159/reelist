class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to films_path
    else
      @errors = @user.errors.full_messages
      render :'users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
