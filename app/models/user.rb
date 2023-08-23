class User < ApplicationRecord
  has_secure_password

  validates :login, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { within: 6..50 }
end
