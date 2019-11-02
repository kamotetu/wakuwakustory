class Maintitle < ApplicationRecord
  has_many :stories, dependent: :destroy
  belongs_to :user

  validates :maintitle,
            :genre, presence: true

  enum genre:{"小説": 1,"ブログ": 2, "情報共有": 3, "エッセイ": 4, "コラム": 5}

  
end