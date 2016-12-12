class AddStatusToClaims < ActiveRecord::Migration[5.0]
  def change
    add_column :claims, :status, :integer
    add_index :claims, :status
  end
end
