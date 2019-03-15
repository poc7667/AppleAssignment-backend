# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  auth_token      :string
#

class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates :email, presence: true, uniqueness: true
  before_create :set_access_token

  private

  def set_access_token
    self.auth_token= generate_token
  end

  def generate_token
    loop do
      auth_token = SecureRandom.hex(10)
      break auth_token unless User.where(auth_token: auth_token).exists?
    end
  end
end
