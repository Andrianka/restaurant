ActiveAdmin.register Reservation do
  permit_params :table_id, :user_id, :order_id, :release_at

  index do
    selectable_column
    id_column
    column :table
    column :user
    column :order
    column :release_at
    column :created_at
    actions
  end

  filter :table
  filter :user
  filter :order
  filter :created_at

  form do |f|
    f.inputs "Reservation Details" do
      f.input :table, label: 'Table', :as => :select, :collection => Table.all.collect{|t| [t.nr, t.id]}
      f.input :user, label: 'User', :as => :select, :collection => User.all.collect{|u| [u.email, u.id]}
      f.input :release_at, as: :datepicker
    end
    f.actions
  end

end
