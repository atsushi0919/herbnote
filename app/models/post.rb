class Post < ApplicationRecord
  belongs_to :user
  has_many :posted_topics, dependent: :destroy
  has_many :herb_properties, through: :posted_topics
  has_one :herb

  # image_uploader.rb のクラス ImageUploader と posts テーブルの image カラムを連携
  mount_uploader :image, ImageUploader

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
