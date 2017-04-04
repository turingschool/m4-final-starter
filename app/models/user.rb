class User < ApplicationRecord
  validates :email_address,
            :password, presence: true
end
