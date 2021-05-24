class HerbProperty < ApplicationRecord
  validates :feature, { presence: true, length: { maximum: 20 } }

  has_many :herb_property_relations
  has_many :herbs, through: :herb_property_relations
end
