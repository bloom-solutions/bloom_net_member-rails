class AddSenderFieldsToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :sender_street, :string
    add_column :txns, :sender_city, :string
    add_column :txns, :sender_province, :string
    add_column :txns, :sender_region, :string
    add_column :txns, :sender_mobile, :string
  end
end
