require 'pry'
class GenresController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @genre = Genre.all
    render :index
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @genre = @artist.genres.new
    render :new
  end

  def create
    @album = Album.find(:album)
    @artist = Artist.find(params[:artist_id])
    @genre = @artist.genres.new(genre_params)
    if @artist.save(@genre)
      redirect_to album_path(@album)
    else
      render :new
    end
  end

def edit
  @artist = Artist.find(params[:artist_id])
  @genre = Genre.find(params[:id])
  render :edit
end

def show
  @artist = Artist.find(params[:artist_id])
  @genre = Genre.find(params[:id])
  render :show
end

def update
  @artist = Artist.find(params[:artist_id])
  @genre = Genre.find(params[:id])
  if @genre.update(genre_params)
    redirect_to album_path(@album)
  else
    render :edit
  end
end

def destroy
  @artist = Artist.find(params[:artist_id])
  @genre = Genre.find(params[:id])
  @genre.destroy
  redirect_to album_path(@album)
end

private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
