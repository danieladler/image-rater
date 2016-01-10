class RatingsController < ApplicationController

  def create
    @rating = Rating.new
    # raise
    @rating.comment  = params[:comment]
    @rating.rating   = params[:rating]
    @rating.photo_id = params[:photo_id]
    @rating.user_id  = @current_user.id
    if @rating.save
      redirect_to photo_path(@rating.photo_id)
    else
      @photos = Photo.all
      render :photos
    end
  end
end
