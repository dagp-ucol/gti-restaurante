class AddOrderFoodStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :order_foods, :status, :integer, :null => false, :default => 1
  end
end
