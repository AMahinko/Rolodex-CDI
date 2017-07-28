class Contact < ApplicationRecord
  belongs_to :user
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => 'Invalid Email'
  before_save :capitalize_first_and_last

  def capitalize_first_and_last
    self.first_name.capitalize!
    self.last_name.capitalize!

  end





end
