require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  it 'Checks for a unique email' do
    User.create({email: 'unique@tester.com', password: '1234', password_confirmation: '1234'})
    User.create({email: 'unique@tester.com', password: '1234', password_confirmation: '1234'})
    print User.all.inspect
    expect(User.count).to eq(1)
  end

  it 'Confirms your password' do
    print User.all.inspect
    User.create({email: 'wrong@tester.com', password: '1234', password_confirmation: '123'})
    expect(User.count).to eq(0)
  end

  it 'validates user email format' do
    #only one is valid
    User.create({email: 'testtester.com', password: '1234', password_confirmation: '1234'})
    User.create({email: 'test@testercom', password: '1234', password_confirmation: '1234'})
    User.create({email: 'tester.com', password: '1234', password_confirmation: '1234'})
    User.create({email: 'te st@testercom', password: '1234', password_confirmation: '1234'})
    User.create({email: 'test@tester.com', password: '1234', password_confirmation: '1234'})
    print User.all.inspect
    expect(User.all.count).to eq(1)
  end

end
