class Owner::UsersController < ApplicationController
  before_action :authenticate_owner!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to owner_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_name, :is_deleted, :profile_image, :family_name, :first_name, :family_name_kana, :first_name_kana)
  end
end
