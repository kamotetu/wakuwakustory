class Story < ApplicationRecord

  belongs_to :maintitle
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_many :tags, dependent: :destroy

  acts_as_taggable

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :story, presence: true

end
