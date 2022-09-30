# frozen_string_literal: true

class DeletePasswordColumnsAdmin < ActiveRecord::Migration[6.1]
  def change
    remove_column(:admins, :password)
  end
end
