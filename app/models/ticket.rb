class Ticket < ApplicationRecord
  validates :table, presence: true
  validates :employee_id, presence: true
end
