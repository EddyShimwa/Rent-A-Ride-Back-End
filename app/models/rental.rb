class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :city, presence: true
  validates :price_per_day, presence: true
end
