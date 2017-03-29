class AddAddressToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :address, :string
  end
end
