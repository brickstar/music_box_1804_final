require 'rails_helper'

describe 'visitor visits genre show spec' do
  before(:each) do
    artist = Artist.create!(name: 'poly')
    @genre = Genre.create(name: 'psych rock')
    @song1 = @genre.songs.create!(title: 'light', length: 1, play_count: 1, rating: 1, artist: artist)
    @song2 = @genre.songs.create!(title: 'dark', length: 3, play_count: 1, rating: 3, artist: artist)
    @song3 = Song.create!(title: 'not here!', length: 3, play_count: 1, rating: 3, artist: artist)
  end
  it 'should see all songs associated with genre' do
    visit genre_path(@genre)

    expect(page).to have_content("Title: #{@song1.title}")
    expect(page).to have_content("Length: #{@song1.length}")
    expect(page).to have_content("Play Count: #{@song1.play_count}")
    expect(page).to have_content("Title: #{@song2.title}")
    expect(page).to have_content("Length: #{@song2.length}")
    expect(page).to have_content("Play Count: #{@song2.play_count}")
    expect(page).to_not have_content("Title: #{@song3.title}")
  end
end