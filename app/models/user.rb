class User < ApplicationRecord
  has_secure_password
  before_create :generate_auth_token

  validates :username, presence: true, uniqueness: true
  validates :password, :password_confirmation, presence: true
  validates :password, confirmation: true

  private

  def generate_auth_token
    self.auth_token = SecureRandom.hex(20)
  end
end
