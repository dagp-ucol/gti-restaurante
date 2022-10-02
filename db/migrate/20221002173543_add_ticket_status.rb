class AddTicketStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :status, :integer
  end
end
