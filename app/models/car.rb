class Car < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals

  validates :name, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :rent_per_day, numericality: { greater_than_or_equal_to: 0 }
end
