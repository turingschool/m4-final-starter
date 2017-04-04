class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :password, :password_confirmation
  validates_uniqueness_of :email
  has_many :links
end