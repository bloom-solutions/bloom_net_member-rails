class CreateTxns < ActiveRecord::Migration[5.0]
  def change
    create_table :txns do |t|
      t.string :recipient_first_name, null: false
      t.string :recipient_last_name, null: false
      t.string :ref_no, null: false
      t.integer :status, default: 0
      t.timestamps
    end

    add_index :txns, :ref_no, unique: true
  end
end
