require 'rails_helper'


  feature 'new user' do
    scenario 'can create user' do
      before_count = User.count
      visit '/'
      click_link 'Not a user? Sign up here!'
      fill_in 'Email', with: "test@test.com"
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
      click_button 'Submit'
      expect(User.count).not_to eq(before_count)
      expect(page).to have_content('Contacts')
    end
  end

feature 'user login' do
  scenario 'user logs in' do
    User.create({email: 'test@tester.com', password: '1234', password_confirmation: '1234'})
    visit '/'
    fill_in 'email', with: 'test@tester.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content('Signed in as test@tester.com')

    #testing logout
    click_link 'Logout'
    expect(page).to have_content('Not a user? Sign up here!')
  end

end
