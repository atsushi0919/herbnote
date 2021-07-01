class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :posted_topics, dependent: :destroy
  has_many :herb_properties, through: :posted_topics

  # image_uploader.rb のクラス ImageUploader と posts テーブルの image カラムを連携
  mount_uploader :image, ImageUploader

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
