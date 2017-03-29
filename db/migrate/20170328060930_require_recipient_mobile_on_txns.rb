class RequireRecipientMobileOnTxns < ActiveRecord::Migration[5.0]
  def change
    change_column :txns, :recipient_mobile, :string, null: false
  end
end
