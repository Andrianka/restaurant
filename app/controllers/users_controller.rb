class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:tab] == 'manager'
      @persons = Person.where(roles_mask: 1)
    elsif params[:tab] == 'client'
      @persons = Person.where(roles_mask: 2)
    elsif params[:tab] == 'cook'
      @persons = Person.where(roles_mask: 4)
    elsif params[:tab] == 'waiter'
      @persons = Person.where(roles_mask: 8)
    elsif params[:tab] == 'boss'
      @persons = Person.where(roles_mask: 16)
    else
      @persons = Person.all
    end
  end

  def show
    @user = User.find(params[:id])
    @user.build_person
  end

  def new
    @user = User.new
    @user.build_person
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def profile
    @user = current_user
    @user.build_person
    @orders = @user.orders.draft
    @reservations = @user.reservations.active
  end

  def upload_avatar
    current_user.person.update_attributes(params[:person])
    redirect_to profile_path(tab: 'avatar')
  end

  private

  def user_params
    params.require(:user).permit(:email, person_attributes: [:id, :first_name,
      :last_name, :tel, :roles, :user_id])
  end

  def person_params
    params.require(:person).permit(:roles, :user_id, :first_name)
  end
end
