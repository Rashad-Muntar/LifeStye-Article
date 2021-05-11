require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do
  before :each do
    User.create(name: 'User', password: 'password')
  end

  it 'Should log in' do
    visit login_path
    fill_in 'session_name', with: 'User'
    click_button 'commit'
    expect(page).to have_content('Sign out')
  end

  it 'Should sign up' do
    visit signup_path
    fill_in 'user_name', with: 'name'
    click_button 'commit'
    expect(current_path).to eql(root_path)
    expect(page).to have_content('Sign out')
  end

  it 'Should sign out' do
    visit login_path
    fill_in 'session_name', with: 'User'
    click_button 'commit'
    expect(current_path).to eql(root_path)
    click_link 'Sign out'
    expect(page).to have_content('You have succesffuly logged out')
  end

end