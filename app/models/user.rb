class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stories
  
  has_many :favorites
  has_many :maintitles, through: :favorites
  # has_many :favorite_maintitles, through: :favorites, source: :maintitle
  
  mount_uploader :my_image, MyImageUploader

  validates :nickname, presence: true


end
