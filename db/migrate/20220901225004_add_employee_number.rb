# frozen_string_literal: true

class AddEmployeeNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :employee_number, :integer
  end
end
