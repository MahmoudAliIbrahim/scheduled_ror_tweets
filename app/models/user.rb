# email:string
# password_digest:string
#
# password:string virual
# password_confirmation:string virual

class User < ApplicationRecord
  has_many :twitter_accounts
  has_secure_password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
end
