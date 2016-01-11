class UsersController < ApplicationController

  def sign_up

  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      UserMailer.subscribe(@user.id).deliver_now
      redirect_to root_path, notice: "Registration Successful. Welcome to ImageRater!"
    else
      render :sign_up
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def update
    @user       = User.find(session[:user_id])
    @user.email = params[:email]
    if @user.save
      redirect_to user_path(:user_id)
    else
      render :sign_up
    end
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
  helper_method :avatar_url

end
