require 'rails_helper'

feature 'visiting the homepage' do
  scenario 'the user sees a list of films and can view them' do
    most_recent_film = Film.create(title: "Forrest Gump")

    visit '/films'
    within(".homepage") do
      expect(page).to have_content most_recent_film.title
      click_link("Forrest Gump")
    end
    expect(page).to have_current_path film_path(most_recent_film)
  end

  scenario 'the user can click a link to see newest reviews' do

    visit '/films'
    within(".homepage") do
      click_link("here")
    end
    expect(page).to have_current_path reviews_path
  end


end
