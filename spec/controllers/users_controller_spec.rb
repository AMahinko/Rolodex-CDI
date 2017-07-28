require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  it 'Checks for a unique email' do
    User.create({email: 'test@tester.com', password: '1234', password_confirmation: '1234'})
    User.create({email: 'test@tester.com', password: '1234', password_confirmation: '1234'})
    print User.all.inspect
    expect(User.count).to eq(1)
  end

  it 'Confirms your password' do
    print User.all.inspect
    User.create({email: 'test@tester.com', password: '1234', password_confirmation: '123'})
    expect(User.count).to eq(0)
  end

end
