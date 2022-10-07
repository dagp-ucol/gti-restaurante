class OrderFood < ApplicationRecord
  validates :food_id, presence: true
  validates :ticket_id, presence: true
end
