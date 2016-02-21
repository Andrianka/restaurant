class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:tab] == 'manager'
      @persons = Person.where(roles_mask: 1).paginate(page: params[:page], per_page: 10)
    elsif params[:tab] == 'client'
      @persons = Person.where(roles_mask: 2).paginate(page: params[:page], per_page: 10)
    elsif params[:tab] == 'cook'
      @persons = Person.where(roles_mask: 4).paginate(page: params[:page], per_page: 10)
    elsif params[:tab] == 'waiter'
      @persons = Person.where(roles_mask: 8).paginate(page: params[:page], per_page: 10)
    elsif params[:tab] == 'boss'
      @persons = Person.where(roles_mask: 16).paginate(page: params[:page], per_page: 10)
    else
      @persons = Person.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @user = User.find(params[:id])
    @user.build_person if !@user.person.present?
  end

  def new
    @user = User.new
    @user.build_person if !@user.person.present?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.points += Point.active.form_completed if Point.active.present? && @user.person.form_completed?
      @user.points += Point.active.registration if Point.active.present?
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.points += Point.active.avatar if Point.active.present? && @user.person.form_completed?
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def profile
    @user = current_user
    @user.build_person if !@user.person.present?
    @orders = @user.orders.draft
    @reservations = @user.reservations.active
  end

  def upload_avatar
    @person = current_user.person
    @person.avatar = params[:user][:person_attributes][:avatar]
    if @person.save
      current_user.points += Point.active.avatar if Point.active.present?
      redirect_to profile_path(tab: 'avatar')
    else
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, person_attributes: [:id, :first_name,
      :last_name, :tel, :roles, :user_id])
  end

  def person_params
    params.require(:person).permit(:roles, :user_id, :first_name)
  end
end
