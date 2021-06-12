class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    # limit=>指定した件数取得,order=>並び替え,desc=>降順
    @posts = Post.limit(4).order(created_at: :desc)
  end
end
