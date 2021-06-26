class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all
    # limit=>指定した件数取得,order=>並び替え,desc=>降順
    @posts = Post.limit(10).order(created_at: :desc)
  end
end
