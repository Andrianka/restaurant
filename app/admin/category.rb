ActiveAdmin.register Category do
  permit_params :name, :title, :description, :order_number

  index do
    selectable_column
    id_column
    column :name
    column :title
    column :description
    column :order_number
    column :created_at
    actions
  end

  filter :name
  filter :order_number
  filter :created_at

end
