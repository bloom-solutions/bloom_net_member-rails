class CreateClaims < ActiveRecord::Migration[5.0]
  def change
    create_table :claims do |t|
      t.string :recipient_first_name, null: false
      t.string :recipient_last_name, null: false
      t.string :ref_no, null: false
      t.decimal :amount
      t.string :txn_status
      t.timestamps
    end
  end
end
