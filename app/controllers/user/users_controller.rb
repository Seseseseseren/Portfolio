class User::UsersController < ApplicationController
  before_action :authenticate_user!

def mypage
  @user = current_user
end

def edit
  @user = current_user
end

def unsubscribe
  @user = current_user
end

def withdraw
  @user = current_user
  @user.update(is_deleted: true)
  reset_session
  redirect_to root_path
end

def update
  if current_user.update(user_params)
    redirect_to mypage_users_path
  else
    redirect_to request.referer
  end
end

private

  def user_params
    params.require(:user).permit(:email, :user_name, :is_deleted, :profile_image, :family_name, :first_name, :family_name_kana, :first_name_kana)
  end

end