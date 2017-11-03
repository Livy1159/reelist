require 'rails_helper'

feature 'visiting the films show page' do
  before :each do
    User.create(email: 'bob@bob.com', username: 'bob', password: 'bobbob', trusted_reviewer: true)
  end

  scenario 'the user can comment on a film' do
    new_film = Film.create(title: "Forrest Gump")

     visit "/films/#{new_film.id}"

    within("#comments") do
      fill_in 'Body', with: 'Great movie'
    end
    click_button 'Create Comment'
    expect("#all-comments").to have_content "Great movie"

  end
end
