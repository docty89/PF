class Public::RelationshipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user.create_notification_follow!(current_user)
    redirect_to request.referer #同じページをリダイレクトする
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

end
