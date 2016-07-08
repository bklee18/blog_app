class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,  format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }


  has_secure_password
end
