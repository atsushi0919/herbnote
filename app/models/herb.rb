class Herb < ApplicationRecord
  has_many :herb_property_relations, dependent: :destroy
  has_many :herb_properties, through: :herb_property_relations, dependent: :destroy

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
end
