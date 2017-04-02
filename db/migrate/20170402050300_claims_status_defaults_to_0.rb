class ClaimsStatusDefaultsTo0 < ActiveRecord::Migration[5.0]
  def change
    change_column :claims, :status, :integer, null: false, default: 0
  end
end
