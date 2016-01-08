class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def find_random_photo
    # add code here in a later refactor
  end

  before_action :set_current_user
end
