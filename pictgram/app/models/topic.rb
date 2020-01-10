class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  #Topic:user 多 対 1
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  # モデルとの関連付け
  mount_uploader :image, ImageUploader
end
