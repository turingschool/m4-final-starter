class User < ActiveRecord::Base
  has_many :links
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
