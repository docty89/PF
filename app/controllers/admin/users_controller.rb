class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
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
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :name, :postal_code, :prefecture_code, :city, :body, :is_deleted, :profile_image_id)
  end
end
