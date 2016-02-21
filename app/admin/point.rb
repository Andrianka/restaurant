ActiveAdmin.register Point do
  permit_params :order, :registration, :avatar, :is_active, :form_completed

  member_action :activate, method: :get do
    @point = Point.find(params[:id])
    Point.update_all(is_active: false)
    @point.update_attributes(is_active: true)
    redirect_to :back
  end

  member_action :deactivate, method: :get do
    @point = Point.find(params[:id])
    @point.update_attributes(is_active: false)
    redirect_to :back
  end


  index do
    selectable_column
    id_column
    column :avatar
    column :registration
    column :form_completed
    column :order
    column :created_at
    actions do |h|
      h.is_active ? link_to('Deactivate', deactivate_admin_point_path(h.id)) : link_to('Activate', activate_admin_point_path(h.id))
    end
  end

  filter :avatar
  filter :registration
  filter :form_completed
  filter :order
  filter :created_at

  form do |f|
    f.inputs "Set points" do
      f.input :form_completed, :label => "Form completed"
      f.input :avatar, label: "Avatar uploaded"
      f.input :order, label: "Order created"
      f.input :registration, label: "New registration"
      f.input :is_active, as: :radio
    end
    f.actions
  end

end
