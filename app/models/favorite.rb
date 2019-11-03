class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :maintitle

  #お気に入り用アソシエーション
  # has_many :favorites, foreign_key: 'maintitle_id', dependent: :destroy
  # has_many :users, through: :favorites

end
