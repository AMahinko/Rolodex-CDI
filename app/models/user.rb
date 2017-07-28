class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :contacts, dependent: :destroy







end
