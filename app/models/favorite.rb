class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # バリデーション(ユーザーと投稿の組み合わせは一意)
  # 同じ投稿を複数回お気に入りさせないため
  # validates_uniqueness_of :post_id, scope: :user_id
end
