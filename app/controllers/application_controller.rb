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
      not_by_user = Photo.where.not(user_id: @current_user.id)
      can_be_rated = []
      can_be_rated = not_by_user.select do |p|
        p.ratings.where(user_id: @current_user.id).empty?
          # alternate syntax:
          # !p.ratings.exists?(user_id: @current_user.id)
      end

      if can_be_rated.empty? == true
        return nil
        redirect_to root_path, notice: "You have reviewed every photo!"
      else
        can_be_rated.sample.id
      end

    elsif @current_user == nil
      photo = Photo.order("RANDOM()").first
      if photo
        photo.id
      end
    end
  end
  helper_method :random_photo

end
