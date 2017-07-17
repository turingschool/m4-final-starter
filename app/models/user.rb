class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true,
                    presence: true

  validates :password_confirmation, presence: true
end
