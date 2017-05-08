class AddTrackingNoToTxns < ActiveRecord::Migration[5.0]
  def up
    add_column :txns, :tracking_no, :string

    Txn.reset_column_information

    Txn.find_each do |txn|
      txn.update_attributes!(tracking_no: txn.ref_no)
    end

    add_index :txns, :tracking_no
  end

  def down
    remove_column :txns, :tracking_no
  end
end
