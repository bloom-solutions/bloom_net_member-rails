class AddRecipientMobileToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :recipient_mobile, :string
  end
end
