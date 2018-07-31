require 'rails_helper'

describe 'visitor visits song show' do
  it 'should see numeric rating for song' do
    artist = Artist.create!(name: 'poly')
    song = Song.create!(title: 'light', length: 1, play_count: 1, rating: 1, artist: artist)

    visit song_path(song.slug)

    expect(page).to have_content("Rating: #{song.rating}")
  end

  it 'should see all genres associated with song and not see unassociated genres' do
    artist = Artist.create!(name: 'poly')
    song = Song.create!(title: 'light', length: 1, play_count: 1, rating: 1, artist: artist)
    genre1 = song.genres.create!(name: 'psych rock')
    genre2 = song.genres.create!(name: 'punk')
    genre3 = Genre.create!(name: 'jazz')

    visit song_path(song.slug)

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to_not have_content(genre3.name)
  end

  xit 'should see songs with same rating' do
    artist = Artist.create!(name: 'poly')
    song1 = Song.create!(title: 'light', length: 1, play_count: 1, rating: 3, artist: artist)
    song2 = Song.create!(title: 'dark', length: 3, play_count: 1, rating: 3, artist: artist)
    song3 = Song.create!(title: 'blah', length: 3, play_count: 1, rating: 3, artist: artist)
    song4 = Song.create!(title: 'blehk', length: 3, play_count: 1, rating: 3, artist: artist)
    song5 = Song.create!(title: 'not here!', length: 3, play_count: 1, rating: 5, artist: artist)

    visit song_path(song1.slug)

    expect(page).to have_content("Songs with the same rating: #{song2.title}, #{song3.title}, #{song4.title}")
  end
end
