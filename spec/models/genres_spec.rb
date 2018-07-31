require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it{should have_many(:songs).through(:song_genres)}
  end

  describe 'instance methods' do
    before(:each) do
      artist = Artist.create!(name: 'poly')
      @genre = Genre.create(name: 'psych rock')
      @song1 = @genre.songs.create!(title: 'light', length: 1, play_count: 1, rating: 1, artist: artist)
      @song2 = @genre.songs.create!(title: 'dark', length: 3, play_count: 1, rating: 3, artist: artist)
      @song3 = Song.create!(title: 'not here!', length: 3, play_count: 1, rating: 5, artist: artist)
    end
    
    it '.average_song_rating' do
      expect(@genre.average_song_rating).to eq(2)
    end

    it '.highest_rated_song' do
      expect(@genre.highest_rated_song).to eq(@song2)
    end

    it '.lowest_rated_song' do
      expect(@genre.lowest_rated_song).to eq(@song1)
    end
  end
end
