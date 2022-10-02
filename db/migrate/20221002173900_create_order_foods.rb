class CreateOrderFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :order_foods do |t|
      t.integer :food_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
