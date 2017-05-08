class AddTxnRefNoToClaims < ActiveRecord::Migration[5.0]
  def up
    add_column :claims, :txn_ref_no, :string

    Claim.reset_column_information

    Claim.completed.find_each do |claim|
      claim.update_attributes!(txn_ref_no: claim.tracking_no)
    end

    add_index :claims, :txn_ref_no
  end

  def down
    remove_column :claims, :txn_ref_no
  end
end
