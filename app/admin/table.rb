ActiveAdmin.register Table do
  permit_params :nr, :quantity

  index do
    selectable_column
    id_column
    column :nr
    column :quantity
    column :created_at
    actions
  end

  filter :nr
  filter :quantity
  filter :created_at

  form do |f|
    f.inputs "Table Details" do
      f.input :nr
      f.input :quantity
    end
    f.actions
  end

end
