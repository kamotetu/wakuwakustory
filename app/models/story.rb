class Story < ApplicationRecord

  belongs_to :maintitle
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  acts_as_taggable

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :story, presence: true

  def previous
    maintitle.stories.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    maintitle.stories.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end  
end
