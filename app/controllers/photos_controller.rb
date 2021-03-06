class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo  = Photo.find(params[:photo_id])
  end

  def update
    @photo             = Photo.find(params[:photo_id])
    @photo.title       = params[:photo][:title]
    @photo.description = params[:photo][:description]
    @photo.image_file  = params[:photo][:image_file]
    @photo.save
    redirect_to photo_path(@photo.id)
  end

  def new
    @photo             = Photo.new
  end

  def add
    @photo             = Photo.new
    @photo.user_id     = @current_user.id
    @photo.title       = params[:photo][:title]
    @photo.description = params[:photo][:description]
    @photo.image_file  = params[:photo][:image_file]
    if @photo.save
      redirect_to photo_path(@photo.id)
    else
      render :new
      # @photos = Photo.all
      # render :photos

      # @photo = Photo.find(params[:photo_id])
      # render "/photos/show"
    end
  end

  def delete
    @photo = Photo.find(params[:photo_id])
    @photo.destroy
    redirect_to root_path
  end

  def ranked
    @photos = Photo.all
    @sorted = @photos.sort_by {|p| p.rating_score}
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image_file)
  end

end
