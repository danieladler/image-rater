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

      # all photos not belonging to current user
      # all_others   = Photo.where.not(user_id: @current_user.id)
      # can_be_rated = []
      #
      # # all_others.each do |p| # p == photo
      # #   # find photos that aren't rated by current user
      # #   p.ratings.each do |r| # r == rating of each photo in iterator
      # #     if r.user.id != @current_user.id
      # #     # put them in a new array
      # #       can_be_rated.push(p)
      # #     else
      # #     end
      # #   end
      # # end
      #
      # # randomly pluck from that new array
      # # raise
      # can_be_rated.sample.id

    elsif @current_user == nil
      photo = Photo.order("RANDOM()").first.id
    end
  end
  helper_method :random_photo

end
