class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  belongs_to :genre
  has_many :favorites, dependent: :destroy

  enum storage: { "常温": 0, "冷蔵": 1, "冷凍": 2 }

  validates :name, :price, :image, :body, :storage, :expired, :prefecture_code, presence: true

  # 0以上の正の数のみ(greater_than_or_equal_to: 0)、整数のみ(only_integer: true)
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  # 引数で渡されたユーザidがFavoritesテーブル内に存在(exists?)していればtrue,存在していなければfalseを返す。
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
