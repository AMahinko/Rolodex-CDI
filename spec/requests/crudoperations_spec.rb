require 'rails_helper'

def setup_user
  visit '/'
  click_link 'Not a user? Sign up here!'
  fill_in 'Email', with: "test@test.com"
  fill_in 'Password', with: '1234'
  fill_in 'Password confirmation', with: '1234'
  click_button 'Submit'
end

def create_contact
  click_link 'Add a contact'
  expect(page).to have_content ('Create a new contact')
  fill_in 'Last name', with: 'dafino'
  fill_in 'Email', with: 'brotherseamus@gmail.com'
  fill_in 'Phone', with: '555-555-5555'
  click_button 'SAVE'
end

feature 'creating, reading, updating and destroying contacts' do


  scenario 'user creates a contact' do
    setup_user
    expect(page).to have_content ('Add a contact')
    create_contact
    expect(page).to have_content('Contacts')
    expect(page).to have_content('Dafino')
  end

  scenario 'user reads a contact' do
    setup_user
    create_contact
    click_link 'Dafino'
    expect(page).to have_content("Showing Dafino")
    expect(page).to_not have_content('Show Contact')
  end

  scenario 'user deletes a contact' do

    setup_user
    create_contact
    contact_count = Contact.count
    click_link('DELETE CONTACT')
    expect(Contact.count).not_to eq(contact_count)
    expect(page).to_not have_content('DaFino')
  end

  scenario 'user updates a contact' do
    setup_user
    create_contact
    click_link('EDIT CONTACT')
    fill_in 'Note', with: 'Like an Irish monk'
    click_button('SAVE')
    expect(page).to have_content('Like an Irish monk')
  end

  scenario 'accessing contacts without authorization' do
    setup_user
    create_contact
    click_link 'Logout'
    contact = Contact.all[0]
    visit "/contacts/#{contact.id}"
    expect(page).to have_content('Please login first')
  end

end
