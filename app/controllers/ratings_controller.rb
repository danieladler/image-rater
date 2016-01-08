class RatingsController < ApplicationController

  def create
    @rating = Rating.new
    @rating.rating   = params[:rating][:rating]
    @rating.comment  = params[:rating][:comment]
    @rating.photo_id = params[:photo_id]
    if @rating.save
      redirect_to photo_path(@rating.photo_id)
    else
      @photos = Photo.all
      render :photos
    end
  end
end
