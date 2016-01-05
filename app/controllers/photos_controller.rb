class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:photo_id])
  end

  def update
  
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
