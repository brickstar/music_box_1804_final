require 'rails_helper'

describe 'visitor visits song show' do
  it 'should see numeric rating for song' do
    song = Song.create(title: 'light', length: 1, play_count: 1, rating: 1)

    visit song_path(song)
  end
end
