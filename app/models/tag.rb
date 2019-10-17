class Tag < ApplicationRecord

  has_many :stories, through: :story_tags
  has_many :story_tags, dependent: :destroy
end
