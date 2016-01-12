ActiveAdmin.register Product do
  permit_params :name, :description, :weight, :quantity, :category_id,
    :price, :image, :is_active

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :weight
    column :price
    column :quantity
    column :is_active
    column :image do |product|
      image_tag(product.image.url(:thumb)) if product.image.present?
    end
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
      f.input :price
      f.input :quantity
      f.input :is_active, as: :radio
      f.input :image, :as => :file, :required => false
      f.input :category_id, label: 'Category', :as => :select, :collection => Category.all.map{|c| [c.name, c.id]}
    end
    f.actions
  end

end
