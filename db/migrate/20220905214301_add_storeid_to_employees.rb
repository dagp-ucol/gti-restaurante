# frozen_string_literal: true

class AddStoreidToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :store_id, :integer
  end
end
