class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_relation, only: [:followings, :followers]

  def create
    @user = User.find_by(id: params[:user_id])
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user.create_notification_follow!(current_user)
    redirect_to request.referer # 同じページをリダイレクトする
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def ensure_relation
    if current_user.id != params[:user_id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end
  
end
