class Maintitle < ApplicationRecord
  has_many :stories, dependent: :destroy
  belongs_to :user

  enum genre:{"小説": 1,"ブログ": 2, "情報共有": 3}
end
