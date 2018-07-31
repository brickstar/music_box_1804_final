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
end
