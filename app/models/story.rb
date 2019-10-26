class Story < ApplicationRecord

  belongs_to :user
  has_many :comments
  
  has_many :tags, dependent: :destroy

  acts_as_taggable

  enum genre:{"小説": 1,"ブログ": 2, "情報共有": 3}

end
