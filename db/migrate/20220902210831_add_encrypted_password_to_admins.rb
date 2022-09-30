# frozen_string_literal: true

class AddEncryptedPasswordToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :password_digest, :string
  end
end
