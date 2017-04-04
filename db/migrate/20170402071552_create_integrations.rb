class CreateIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :integrations do |t|
      t.string :callback_url, null: false
      t.timestamps
    end
  end
end
