class AddSenderNameToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :sender_first_name, :string
    add_column :txns, :sender_last_name, :string
  end
end
