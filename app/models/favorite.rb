class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :name, length: { maximum: 30 }, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { maximum: 2000 }
end
