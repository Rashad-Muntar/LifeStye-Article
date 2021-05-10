require 'rails_helper'

feature 'Log in feature page', type: :feature do
  feature 'Login an existing user' do
    before(:each) do
      User.create(name: 'foo')
      visit '/login'
      within('form') do
        fill_in 'session[name]', with: 'foo'
        find_field(id: 'session_password', type: :hidden).set('password')
        click_button 'Log in'
        expect(page).to have_content('Sign out')
      end
    end
  end
end
