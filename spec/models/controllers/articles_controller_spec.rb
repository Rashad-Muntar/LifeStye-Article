require 'rails_helper'

feature 'Creating a post', type: :feature do
  feature 'User must login and fill in comment' do
    before(:each) do
      User.create(name: 'foo')
      visit '/login'
      within('form') do
        fill_in 'session_name', with: 'foo'
        find_field(id: 'session_password', type: :hidden).set('password')
        click_button 'Log in'
      end
      visit '/articles/new'
      within('form') do
      fill_in 'article_title', with: 'Article.'
      fill_in 'article_text', with: 'We are creating article.'
        click_button 'commit'
        expect(page).to have_content('Article was successfully created.')
      end
    end
  end
end
