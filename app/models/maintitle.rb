class Maintitle < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites

  acts_as_taggable

  mount_uploader :cover, CoverUploader

  validates :maintitle, presence: true
  validates :genre, presence: true

  enum genre:{"青春": 1,"恋愛": 2, "時代,歴史": 3, "ホラー": 4, "ファンタジー": 5, "推理": 6, "ライトノベル": 7, "その他": 8}

  

  
end