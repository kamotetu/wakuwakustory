class Tag < ApplicationRecord

  has_many :stories, through: :story_tags
  has_many :stories, dependent: :destroy
end
