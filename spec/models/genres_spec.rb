require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it{should have_many(:songs).through(:song_genres)}
  end

  describe 'instance methods' do
    it '.average_song_rating' do
      artist = Artist.create!(name: 'poly')
      genre = Genre.create(name: 'psych rock')
      song1 = genre.songs.create!(title: 'light', length: 1, play_count: 1, rating: 1, artist: artist)
      song2 = genre.songs.create!(title: 'dark', length: 3, play_count: 1, rating: 3, artist: artist)
      song3 = Song.create!(title: 'not here!', length: 3, play_count: 1, rating: 3, artist: artist)

      expect(genre.average_song_rating).to eq(2)
    end
  end
end
