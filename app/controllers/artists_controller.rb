class ArtistsController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @artists = Artist.all
    render :index
  end

  def new
    @album = Album.find(params[:album_id])
    @artist = @album.artists.new
    render :new
  end

  def create
    @album = Album.find(params[:album_id])
    @artist = @album.artists.new(artist_params)
    if @album.save(@artist)
      redirect_to album_path(@album)
    else
      render :new
    end
  end

def edit
  @album = Album.find(params[:album_id])
  @artist = Artist.find(params[:id])
  render :edit
end

def show
  @album = Album.find(params[:album_id])
  @artist = Artist.find(params[:id])
  render :show
end

def update
  @artist = Artist.find(params[:id])
  if @artist.update(artist_params)
    redirect_to album_path(@artist.album)
  else
    render :edit
  end
end

def destroy
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect_to album_path(@artist.album)
end

private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
