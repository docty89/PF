class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    # postsテーブルから、お気に入り登録済みのレコードを取得
    @favorite_list = Post.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end
end
