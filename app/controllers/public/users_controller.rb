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

  def quit_confirm

  end

  def quit
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会完了"
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :postal_code, :prefecture_code, :city, :body, :is_deleted, :profile_image_id)
  end
end
