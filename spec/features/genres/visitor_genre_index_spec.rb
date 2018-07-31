require 'rails_helper'


describe 'visitor visits genre index' do
  it 'should see all genres' do
    genre1 = Genre.create!(name: 'rock')
    genre2 = Genre.create!(name: 'roll')

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end

  it 'should not see form to create genre' do

    visit genres_path

    expect(page).to_not have_field('genre[name]')
    expect(page).to_not have_button('Create Genre')
  end

  it 'should see genre names as link to genre show' do
    genre1 = Genre.create!(name: 'rock')
    genre2 = Genre.create!(name: 'roll')

    visit genres_path

    expect(page).to have_link(genre1.name)
    expect(page).to have_link(genre2.name)

    click_on "#{genre1.name}"

    expect(current_path).to eq(genre_path(genre1))
  end

  it 'should not see new path' do
    visit new_genre_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
