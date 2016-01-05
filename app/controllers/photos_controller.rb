class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:photo_id])
  end

  def rate
    @photo = Photo.random
  end

  def rankings
  end

end
