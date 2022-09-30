# frozen_string_literal: true

class Attendance < ApplicationRecord
  # Relations
  belongs_to :store
  belongs_to :employee

  # callbacks
  before_save :check_in_registration
  before_validation :store_id_relationship

  # scope
  scope :today_attendances, -> { where(check_in: Date.today.all_day) }

  private

  def check_in_registration
    self.check_in = DateTime.now.to_s(:db)
  end

  def store_id_relationship
    @employee = Employee.find(employee_id)
    self.store_id = @employee.store_id
  end
end
