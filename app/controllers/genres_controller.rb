class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = 'you created a genre!'
      redirect_to genres_path
    else
      flash[:error] = 'your creation did not work'
      redirect_to genres_path
    end
  end

  def new
    render file: 'public/404'
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
