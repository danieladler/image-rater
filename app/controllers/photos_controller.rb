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

  def new
    @photo             = Photo.new
    # raise
  end

  def add
    @photo             = Photo.new
    @photo.title       = params[:photo][:title]
    @photo.description = params[:photo][:description]
    if @photo.save
      redirect_to photo_path(@photo.id)
    else
      @photos = Photo.all
      render :photos
    end
  end

  def delete
    @photo = Photo.find(params[:photo_id])
    @photo.destroy
    redirect_to root_path
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
