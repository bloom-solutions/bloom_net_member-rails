class ChangeTxnStatusToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :txns, :status, :string
    add_column :txns, :status, :integer, default: 0
    add_index :txns, :status
  end
end
