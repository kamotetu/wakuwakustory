class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :stories, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :maintitles, dependent: :destroy
  has_many :maintitles, through: :favorites
  has_many :reviews, dependent: :destroy
  # has_many :favorite_maintitles, through: :favorites, source: :maintitle
  
  mount_uploader :my_image, MyImageUploader

  validates :nickname, presence: true


end
