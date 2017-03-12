class AddUserIdToTxns < ActiveRecord::Migration[5.0]
  def change
    add_reference :txns, :user, foreign_key: true
  end
end
