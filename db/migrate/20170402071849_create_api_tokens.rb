class CreateApiTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :api_tokens do |t|
      t.references :integration
      t.string :token, index: true, null: false
      t.string :secret, null: false
      t.timestamps
    end
  end
end
