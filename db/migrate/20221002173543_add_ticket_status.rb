class AddTicketStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :status, :boolean, :null => false, :default => true
  end
end
