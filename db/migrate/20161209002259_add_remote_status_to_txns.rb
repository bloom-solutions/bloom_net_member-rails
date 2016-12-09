class AddRemoteStatusToTxns < ActiveRecord::Migration[5.0]
  def change
    add_column :txns, :remote_status, :string
  end
end
