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
      @photo = Photo.find(params[:photo_id])
      @photographer = User.find(@photo.user_id)
      if @photographer.accept_rating_email == true
        # first arg is photo owner, second arg is reviewer, third is the rating object itself
        UserMailer.reviewed(@photographer.id,@rating.user_id,@rating.id,@photo.id).deliver_now
        redirect_to photo_path(@rating.photo_id)
      else
        redirect_to photo_path(@rating.photo_id)
      end
    else
      @photo = Photo.find(params[:photo_id])
      render "/photos/show"
    end
  end
end
