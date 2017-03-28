class AddRecipientFieldsToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :recipient_street, :string
    add_column :txns, :recipient_city, :string
    add_column :txns, :recipient_province, :string
    add_column :txns, :recipient_region, :string
  end
end
