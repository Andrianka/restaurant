ActiveAdmin.register Product do
  permit_params :name, :description, :weight, :quantity, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :weight
    column :quantity
    column :category
    column :created_at
    actions
  end

  filter :name
  filter :category
  filter :weight
  filter :quantity
  filter :created_at

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :weight
      f.input :quantity
      f.input :category_id, label: 'Category', :as => :select, :collection => Category.all.map{|c| [c.name, c.id]}
    end
    f.actions
  end

end
