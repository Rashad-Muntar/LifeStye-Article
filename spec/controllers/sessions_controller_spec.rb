require 'rails_helper'


feature 'Log in feature page', type: :feature do
    feature 'Login an existing user' do
      before(:each) do
        User.create(name: 'Foo', password: 'password')
        visit '/login'
        within('#form') do
          fill_in 'Email', with: 'foo@mail.com'
          fill_in 'Password', with: 'password'
        end
        click_button 'Log in'
      end
  
      scenario 'when you login with valid params' do
        expect(page).to have_content('You have succesffuly logged in')
        expect(page).to have_content('Sign out')
      end
    end
  end