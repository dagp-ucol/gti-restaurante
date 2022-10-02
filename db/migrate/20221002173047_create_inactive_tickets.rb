class CreateInactiveTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :inactive_tickets do |t|

      t.timestamps
    end
  end
end
