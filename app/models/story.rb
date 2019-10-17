class Story < ApplicationRecord

  belongs_to :user
  has_many :comments
  
  has_many :tags, dependent: :destroy

  acts_as_taggable
end
