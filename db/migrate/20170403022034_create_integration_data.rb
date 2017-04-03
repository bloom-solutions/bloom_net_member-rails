class CreateIntegrationData < ActiveRecord::Migration[5.0]
  def change
    create_table :integration_data do |t|
      t.string :owner_type, null: false
      t.string :owner_id, null: false
      t.jsonb :data, index: true
    end

    add_index :integration_data, [:owner_type, :owner_id]
  end
end
