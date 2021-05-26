class HerbPropertyRelation < ApplicationRecord
  belongs_to :herb
  belongs_to :herb_property

  validates :herb_id, uniqueness: { scope: :herb_property_id }
end
