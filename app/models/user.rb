class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,  format: { with: VALID_EMAIL_REGEX }


  has_secure_password
end
