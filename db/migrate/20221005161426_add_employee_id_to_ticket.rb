class AddEmployeeIdToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :employee_id, :integer, :null => false, :default => 1
  end
end
