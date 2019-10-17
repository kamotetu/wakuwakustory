class Story < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :tags, through: :story_tags
  has_many :story_tags, dependent: :destroy
end
