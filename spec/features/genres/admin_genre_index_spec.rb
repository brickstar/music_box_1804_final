require 'rails_helper'

describe 'admin user visits genre index' do
  it 'should see all genre names' do
    admin = User.new(username: 'pearl', password: 'lovelove', role: 1)
    genre1 = Genre.create!(name: 'rock')
    genre2 = Genre.create!(name: 'roll')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end

  it 'should see a form to create new genre, and be able to create a genre' do
    admin = User.new(username: 'pearl', password: 'lovelove', role: 1)
    genre1 = Genre.create!(name: 'horror')
    genre2 = Genre.create!(name: 'spy')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    fill_in 'genre[name]', with: 'jazz'

    click_on 'Create Genre'

    expect(current_path).to eq(genres_path)
    expect(Genre.last.name).to eq('jazz')
    genre3 = Genre.last
    expect(page).to have_link(genre3.name)
    expect(page).to have_link(genre2.name)
    expect(page).to have_link(genre1.name)
  end
end
