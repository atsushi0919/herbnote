class Herb < ApplicationRecord
  has_many :herb_property_relations, dependent: :destroy
  has_many :herb_properties, through: :herb_property_relations, dependent: :destroy
  has_many :favorite_herbs, dependent: :destroy
  # お気に入り登録しているユーザー一覧
  has_many :favorited_users, through: :favorite_herbs, source: :user
  has_one :herb_description, dependent: :destroy

  validates :name, { presence: true, length: { maximum: 20 } }
  validates :alies, { length: { maximum: 20 } }
  validates :classification, presence: true
  validates :image, presence: true

  enum classification: {
    others: 0,
    epemeral: 1,
    perennial: 2,
    shurub: 3,
    tree: 4,
  }

  def favorited_by?(user)
    #favorite_herbs.exists?(user_id: user.id)
    favorite_herbs.any? { |favorite| favorite.user_id == user.id }
  end
end
