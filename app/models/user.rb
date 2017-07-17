class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email, message: 'Email is already in use'
  validates_presence_of :email, message: 'Email cannot be blank'
  validates_presence_of :password, message: 'Password cannot be blank'
  validates_presence_of :password_confirmation, message: 'Password confirmation cannot be blank'
end
