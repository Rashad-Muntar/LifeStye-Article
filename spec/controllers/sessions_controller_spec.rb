require 'rails_helper'



RSpec.feature 'Authentications', type: :feature do

  let!(:user) do
    User.create(name: 'John Doe',
                password: 'johndoe')
  end

  describe 'Log in' do
    before do
      visit login_path
    end

    it 'visits the login page' do
      have_link 'Log In', href: login_path
      have_link 'Register', href: signup_path
      have_link 'Home', href: root_path
      expect(page).to have_content('login')
    end

    context 'if login information valid' do
      it 'logs in user' do
        fill_in 'name', with: user.name
        click_button 'Log In'
        expect(page).to have_content("You have succesffuly logged in")
        expect(current_path).to eq root_path
        have_link 'Home', href: root_path
        have_link ' Write Article', href: new_article_path
        have_link 'Sign out', href: signout_path
      end
    end

    describe 'Log out', type: :feature do
      before do
        visit login_path
        fill_in 'name', with: user.username
        click_button 'Log In'
      end

      context 'when logged out' do
        before { click_on 'Logout' }
        it 'redirects to the home page' do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("You have succesffuly logged out")
        end
      end
    end
  end
end