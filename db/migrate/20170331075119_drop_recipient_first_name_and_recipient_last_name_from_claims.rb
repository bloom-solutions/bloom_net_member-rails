class DropRecipientFirstNameAndRecipientLastNameFromClaims < ActiveRecord::Migration[5.0]
  def change
    remove_column :claims, :recipient_first_name, :string, null: false
    remove_column :claims, :recipient_last_name, :string, null: false
  end
end
