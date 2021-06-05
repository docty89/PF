class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  attachment :profile_image
  enum sex: { "男性": 0, "女性": 1}

  has_many :user_rooms
  has_many :chats
  has_many :favorites, dependent: :destroy
end
