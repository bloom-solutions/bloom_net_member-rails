class BridgeReceiveCallback < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_receive_callbacks do |t|
      t.integer :external_id, limit: 8, null: false
      t.string :from, null: false
      t.string :route, null: false
      t.decimal :amount, null: false
      t.string :asset_code, null: false
      t.string :memo_type, null: false
      t.string :memo, null: false
      t.text :data

      t.timestamps
    end

    add_index :bridge_receive_callbacks, :external_id, unique: true
    add_index :bridge_receive_callbacks, :from
    add_index :bridge_receive_callbacks, :asset_code
    add_index :bridge_receive_callbacks, :memo
  end
end
