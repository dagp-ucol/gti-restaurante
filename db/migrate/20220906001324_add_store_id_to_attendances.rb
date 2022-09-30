# frozen_string_literal: true

class AddStoreIdToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :store_id, :integer
  end
end
