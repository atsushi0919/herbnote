class HerbPropertyRelation < ApplicationRecord
  belongs_to :herb
  belongs_to :herb_property
end
