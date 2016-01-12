class UsersController < ApplicationController

  def sign_up

  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation, :accept_rating_email))
    if @user.save
      session[:user_id] = @user.id
      UserMailer.subscribe(@user.id).deliver_now
      redirect_to root_path, notice: "Registration Successful. Welcome to ImageRater!"
    else
      render :sign_up
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def update
    @user                     = User.find(params[:user_id])
    @user.accept_rating_email = params[:receive]
    @user.email = params[:email] if params[:email]
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "users/show"
    end
  end

end
