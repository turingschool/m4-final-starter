class User < ApplicationRecord
  validates :email_address,
            :password, presence: true
  validates :email_address, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
