require 'rails_helper'

describe 'visitor visits song show' do
  it 'should see numeric rating for song' do
    artist = Artist.create!(name: 'poly')
    song = Song.create!(title: 'light', length: 1, play_count: 1, rating: 1, artist: artist)

    visit song_path(song.slug)

    expect(page).to have_content("Rating: #{song.rating}")
  end
end
