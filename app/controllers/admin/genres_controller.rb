class Admin::GenresController < ApplicationController
  before_action :require_admin

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

  private

  def require_admin
    render file:'/public/404' unless current_admin?
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
