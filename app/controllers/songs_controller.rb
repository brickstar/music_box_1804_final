class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(slug: params[:slug])
    @songs_with_same_rating = Song.songs_with_same_rating(@song.rating)
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to "/songs"
    else
      render :new
    end
  end

  private
    def song_params
      params.require(:song).permit(:title, :length, :play_count)
    end

end
