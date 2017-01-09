class User < ApplicationRecord
  has_secure_password

  has_many :links

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
end
