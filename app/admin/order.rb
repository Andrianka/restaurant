ActiveAdmin.register Order do
  batch_action :new, false
  actions :all, except: [:new, :create]
  permit_params :status, :user_id, :category,
                order_items_attributes: [:id, :product_id, :quantity]


  index do
    selectable_column
    id_column
    column :user
    column :status
    column :created_at
    actions
  end

  filter :user
  filter :status
  filter :created_at

  form do |f|
    f.inputs "Order Details" do
      f.input :user_id, label: 'User', :as => :select,
              :collection => User.all.map{|u| [u.email, u.id]}
      f.input :status, :as => :select, :collection => Order::Statuses
    end

    f.inputs 'Items' do
      f.has_many :order_items, new_record: true, allow_destroy: true do |i|
        # i.input :category, label: 'Category', :as => :select,
        #         input_html: {class: 'p_category'},
        #         :collection => Category.all.map{|c| [c.name, c.id]}
        # i.input :product_id, label: 'Product', :as => :select,
        #         :collection =>
        #         params[:category].nil? ? Product.all.map{|p| [p.name, p.id]} :
        #         Category.find(getCategoryParams()).products.all.map{|p| [p.name, p.id]}
        i.input :category, :label => 'Category', :as => :select,
        input_html: {id: 'category_id'},
        :collection => Category.order(:name), :include_blank => true

        i.input :product_id, :label => 'Product', :as => :select,
        input_html: {id: 'product_id'},
        :collection => option_groups_from_collection_for_select(Category.order(:name), :products, :name, :id, :name)
        i.input :quantity
      end
    end

    f.actions
  end
end
