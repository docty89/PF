class Public::PostsController < ApplicationController
  before_action :set_q, only: %i[index search]
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
    if params[:id]
      @genre = Genre.find(params[:id])
      @posts = @genre.posts.all.order(created_at: :desc).page(params[:page]).per(9)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(9)
    end
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @genre = Genre.find(@post.genre_id)
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @results = @q.result.page(params[:page]).per(9)
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:price, :image, :name, :body, :is_active, :genre_id, :storage, :expired,
                                 :prefecture_code)
  end
end
