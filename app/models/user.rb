class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :reservations
  has_many :cars, through: :reservations
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 30 }
end
