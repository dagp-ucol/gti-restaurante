# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.integer :private_number
      t.boolean :working

      t.timestamps
    end
  end
end
