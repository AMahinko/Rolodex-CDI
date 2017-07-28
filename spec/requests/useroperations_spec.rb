require 'rails_helper'

def create_user
  visit '/'
  click_link 'Not a user? Sign up here!'
  fill_in 'Email', with: "test@test.com"
  fill_in 'Password', with: '1234'
  fill_in 'Password confirmation', with: '1234'
  click_button 'Submit'

end


  feature 'new user' do
    scenario 'can create user' do
      before_count = User.count
      create_user
      expect(User.count).not_to eq(before_count)
      expect(page).to have_content('Contacts')
    end

    scenario 'new users email not unique' do
      create_user
      click_link 'Logout'
      before_count = User.count
      create_user
      expect(User.count).to eq(before_count)
      expect(page).to_not have_content('Contacts')
    end

  end

feature 'user login' do
  scenario 'user logs in' do
    create_user
    #testing logout
    click_link 'Logout'
    expect(page).to have_content('Not a user? Sign up here!')
    #testing login
    visit '/'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content('Signed in as test@test.com')

  end

  feature 'delete user' do

    scenario 'user deletes their account' do

      create_user
      user_count = User.count
      click_link 'DELETE ACCOUNT'
      expect(user_count).to_not eq(User.count)
      expect(page).to have_content('Account deleted!')
    end

  end

end
