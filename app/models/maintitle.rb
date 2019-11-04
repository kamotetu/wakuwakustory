class Maintitle < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites

  validates :maintitle, presence: true
  validates :genre, presence: true

  enum genre:{"小説": 1,"ブログ": 2, "情報発信": 3, "エッセイ": 4, "コラム": 5}

  

  
end