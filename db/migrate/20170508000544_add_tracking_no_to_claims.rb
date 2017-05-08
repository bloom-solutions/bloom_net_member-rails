class AddTrackingNoToClaims < ActiveRecord::Migration[5.0]
  def change
    rename_column :claims, :ref_no, :tracking_no
  end
end
