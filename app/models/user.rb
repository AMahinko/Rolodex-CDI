class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :contacts, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      random_password = SecureRandom.urlsafe_base64
      user.provider = auth.provider
      user.email = auth.info.email
      user.password = random_password
      user.password_confirmation = random_password
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end







end
