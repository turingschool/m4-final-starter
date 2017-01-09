class User < ApplicationRecord
  has_secure_password

  validates :password, length: { in: 4..20 }
  validates :email_address, presence: true
  validates_format_of :email_address, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


end
