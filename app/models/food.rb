class Food < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :food_type, presence: true
end
