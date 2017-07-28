require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  it 'Capitalizes names' do
    user = User.create({email: 'test@tester.com', password: '1234', password_confirmation: '1234'})
    contact = Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id, email: 'something@orother.com'})
    contact.save!
    expect(contact.first_name).to eq('Lower')
    expect(contact.last_name).to eq('Case')
    Contact.delete(1)
  end

  it 'validates email formatting' do
    #only one is valid
    user = User.create({email: 'test@tester.com', password: '1234', password_confirmation: '1234'})
    Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id, email: 'somethingorother.com'})
    Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id, email: 'something@orothercom'})
    Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id, email: 'orother.com'})
    Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id, email: 'some\$%^$g@oro\#ther.com'})
    Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id, email: 'something@orother.com'})
    expect(Contact.all.count).to eq(1)

  end



end
