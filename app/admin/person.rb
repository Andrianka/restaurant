ActiveAdmin.register Person do
  @person_params = [:first_name, :last_name, :tel, :avatar, roles: []]
  @user_params = [:email, :password, :password_confirmation, :points]
  permit_params @person_params, @user_params

  index do
    selectable_column
    id_column
    column "Email", :user do |u|
      u.user.email if u.user
    end
    column :points, :user do |u|
      u.user.points if u.user
    end
    column :current_sign_in_at, :user do |u|
      u.user.current_sign_in_at if u.user
    end
    column :sign_in_count, :user do |u|
      u.user.sign_in_count if u.user
    end
    column :created_at, :user do |u|
      u.user.created_at if u.user
    end
    actions
  end

  filter :user_email, :as => :string
  filter :user_current_sign_in_at, :as => :string
  filter :user_sign_in_count, :as => :string
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.fields_for :user do |b|
        b.input :email
      end
      f.fields_for :users do |b|
        b.input :points
      end
    end
    f.inputs "Person Details" do
      f.input :first_name
      f.input :last_name
      f.input :tel
      f.input :avatar, :as => :file
      f.input :roles, collection: options_for_select(Person.valid_roles.collect{|s| [t("roles.#{s}"), s]}, person.roles.to_a), :multiple=>'multiple'
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      user_params.each do |u|
        row u
      end
      (Person.column_names - [:avatar]).each do |p|
        row p
      end
      row :avatar do
        image_tag(ad.avatar.url(:thumb))
      end
    end
  end

  controller do
    def create
      generated_password = Devise.friendly_token.first(8)
      @user = User.create(email: params[:person][:user][:email],
      password: generated_password, person_attributes: permitted_params[:person])
      UserMailer.welcome(@user, generated_password).deliver_now
      redirect_to admin_people_path
    end
  end
end
