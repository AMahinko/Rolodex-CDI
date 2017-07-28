require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  it 'Capitalizes names' do
    user = User.create({email: 'test@test.com', password: '1234', password_confirmation: '1234'})
    contact = Contact.create({first_name: 'lower', last_name: 'case', user_id: user.id})
    contact.save!
    print Contact.all.inspect
    expect(contact.first_name).to eq('Lower')
    expect(contact.last_name).to eq('Case')
  end

  it 'validates email formatting' do

  end



end
