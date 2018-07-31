class Genre < ApplicationRecord
  has_many :song_genres
  has_many :songs, through: :song_genres

  validates_presence_of :name

  def average_song_rating
    songs.average(:rating)
  end

  def highest_rated_song
    songs.order(rating: :desc).limit(1)[0]
  end

  def lowest_rated_song
    songs.order(rating: :asc).limit(1)[0]
  end
end
