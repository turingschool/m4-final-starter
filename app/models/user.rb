class User < ApplicationRecord
  validates :email_address,
            :password, presence: true
  validates :email_address, uniqueness: true
end
