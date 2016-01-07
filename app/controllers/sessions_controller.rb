class SessionsController < ApplicationController
  def sign_in
      @user = User.find_by(username: params[:username])
      if @user == nil
        redirect_to root_path, notice: "Wrong username or password"
      elsif @user.authenticate(params[:password])
        session[:user_id] = @user.id
        raise
        redirect_to root_path
      else
        redirect_to root_path, notice: "Wrong username or password"
      end
    end

    def sign_out
      session.delete(:user_id)
      redirect_to "/"
    end
end
