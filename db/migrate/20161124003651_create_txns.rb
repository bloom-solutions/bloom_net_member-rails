class CreateTxns < ActiveRecord::Migration[5.0]
  def change
    create_table :txns do |t|
      t.string :recipient_first_name, null: false
      t.string :recipient_last_name, null: false
      t.string :ref_no
      t.string :status
      t.decimal :amount, null: false, default: 0.0
      t.timestamps
    end

    add_index :txns, :ref_no, unique: true
    add_index :txns, :status
  end
end
