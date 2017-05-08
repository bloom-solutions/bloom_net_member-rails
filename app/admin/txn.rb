ActiveAdmin.register Txn do

  actions :index, :show

  index do
    selectable_column
    id_column
    column :sender_last_name
    column :sender_first_name
    column :recipient_last_name
    column :recipient_first_name
    column :ref_no
    column :tracking_no
    column :created_at
    actions
  end

  filter :sender_last_name
  filter :sender_first_name
  filter :recipient_last_name
  filter :recipient_first_name
  filter :ref_no
  filter :tracking_no
  filter :created_at

end
