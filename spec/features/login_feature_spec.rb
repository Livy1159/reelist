require 'rails_helper'

describe "the login process", :type => :feature do
  before :each do
    User.create(email: 'bob@bob.com', username: 'bob', password: 'bobbob')
  end

  it 'logs me in' do
    visit '/users/new'
    within("#login") do
      fill_in 'username', with: 'bob'
      fill_in 'password', with: 'bobbob'
    end
    click_button 'Login'
    expect(page).to have_current_path films_path
  end

  it 'registers me' do
    visit '/users/new'
    within("#register") do
      fill_in 'Email', with: 'tom@tom.com'
      fill_in 'Username', with: 'tomtom'
      fill_in 'Password', with: 'tomtom'
    end
    click_button 'Create User'
    expect(page).to have_current_path films_path
  end

end

