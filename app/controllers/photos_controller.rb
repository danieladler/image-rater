class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:photo_id])
  end

  def update
    @photo             = Photo.find(params[:photo_id])
    @photo.title       = params[:photo][:title]
    @photo.description = params[:photo][:description]
    @photo.image_file  = params[:photo][:image_file]
    # raise
    @photo.save
    redirect_to photo_path(@photo.id)
  end

  def create
  end

  def rate
    @photo = Photo.random
  end

  def rankings
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image_file)
  end

end
