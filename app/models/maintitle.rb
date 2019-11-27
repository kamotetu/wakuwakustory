class Maintitle < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :reviews, dependent: :destroy



  acts_as_taggable

  mount_uploader :cover, CoverUploader

  def favorited_by?(user) #いいねしているかどうか
    favorites.where(user_id: user.id).exists?
  end

  def reviewed_by?(user)
    reviews.where(user_id: user.id).exists?
  end

  validates :maintitle, presence: true
  validates :genre, presence: true

  enum genre:{"青春": 1,"恋愛": 2, "時代,歴史": 3, "ホラー": 4, "ファンタジー": 5, "推理": 6, "ライトノベル": 7, "その他": 8}

  

  
end