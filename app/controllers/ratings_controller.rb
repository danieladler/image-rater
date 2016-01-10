class RatingsController < ApplicationController

  def create
    @rating = Rating.new
    if params[:rating] == "bad"
      @rating.rating = 1
    elsif params[:rating] == "meh"
      @rating.rating = 2
    elsif params[:rating] == "good"
      @rating.rating = 3
    end
    @rating.comment  = params[:comment]
    @rating.photo_id = params[:photo_id]
    @rating.user_id  = @current_user.id
    if @rating.save
      redirect_to photo_path(@rating.photo_id)
    else
      @photo = Photo.find(params[:photo_id])
      render "/photos/show"
    end
  end
end
