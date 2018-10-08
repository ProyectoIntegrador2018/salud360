class User < ApplicationRecord

  validates :name, presence: true, length: {maximum: 50}
  validates :username, presence: true, length: {maximum: 20}
  validates :tipo, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
