class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites, dependent: :destroy

  #引数で渡されたユーザidがFavoritesテーブル内に存在(exists?)していればtrue,存在していなければfalseを返す。
  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    where(["name like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
