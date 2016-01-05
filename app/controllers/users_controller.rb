class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
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
    @user = User.find(params[:id])
    @user.build_person(person_params)
  end

  private

  def user_params
    params.require(:user).permit(person_attributes: [:id, :first_name,
      :last_name, :tel, :roles, :user_id])
  end

  # def person_params
  #   params.require(:person).permit(:roles, :user_id)
  # end
end
