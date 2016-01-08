class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
  before_action :set_current_user

  def random_photo
    if @current_user
      all_others = Photo.where.not(user_id: @current_user.id).random.id
    elsif @current_user == nil
      photo = Photo.order("RANDOM()").first.id
    end
  end
  helper_method :random_photo

end
