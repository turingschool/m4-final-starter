class User < ApplicationRecord
  has_secure_password
  has_many :links

  validates :email,
              uniqueness: true
  validates :email,
            :password,
              presence: true
end
