require 'rails_helper'

describe Song, type: :model do
  describe 'validations' do

    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:length)}
    it{should validate_presence_of(:play_count)}
  end

  describe 'relationships' do
    it{should belong_to(:artist)}
    it{should have_many(:genres).through(:song_genres)}

  end

  describe 'class methods' do
    it '.songs_with_same_rating' do
      artist = Artist.create!(name: 'poly')
      song1 = Song.create!(title: 'light', length: 1, play_count: 1, rating: 3, artist: artist)
      song2 = Song.create!(title: 'dark', length: 3, play_count: 1, rating: 3, artist: artist)
      song3 = Song.create!(title: 'blah', length: 3, play_count: 1, rating: 3, artist: artist)
      song4 = Song.create!(title: 'blah', length: 3, play_count: 1, rating: 3, artist: artist)
      song5 = Song.create!(title: 'not here!', length: 3, play_count: 1, rating: 5, artist: artist)

      expect(Song.songs_with_same_rating(song1.rating)).to eq([song1, song2, song3, song4])
    end
  end
end
