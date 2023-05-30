class User < ApplicationRecord
  has_many :rentals
  has_many :cars, through: :rentals

  has_secure_password
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { maximum: 30 }
end
