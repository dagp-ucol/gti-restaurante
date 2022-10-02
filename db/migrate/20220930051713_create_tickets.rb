class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :table
      t.float :final_price

      t.timestamps
    end
  end
end
