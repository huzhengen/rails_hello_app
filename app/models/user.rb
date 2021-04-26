class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username
  # validates_presence_of :password_confirmation, on: [:create]

  # validates_format_of :email, with: /.+@.+/, if: :email
  # validates :password, length: { minimum: 6 }, on: [:create], if: :password
end
