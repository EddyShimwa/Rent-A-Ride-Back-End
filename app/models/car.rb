class Car < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals
  
  validates :name, length: { greater_than: 3 }
  validates :description, length: { maximum: 2000 }
  validates :rent_per_day, comparison: { greater_than_or_equal_to: 0 }
end
