class Story < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :tags, through: :story_tags
  has_many :tags, dependent: :destroy
end
