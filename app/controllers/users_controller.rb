class UsersController < ApplicationController

  def sign_up

  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :sign_up
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

end
