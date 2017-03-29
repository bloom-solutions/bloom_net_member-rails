class AddCurrencyToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :currency, :string
  end
end
